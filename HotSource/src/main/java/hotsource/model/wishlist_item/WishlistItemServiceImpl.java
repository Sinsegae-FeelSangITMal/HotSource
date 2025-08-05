package hotsource.model.wishlist_item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Asset;
import hotsource.domain.Wishlist;
import hotsource.domain.WishlistItem;
import hotsource.exception.WishlistItemException;
import hotsource.model.wishlist.WishlistService;

@Service
public class WishlistItemServiceImpl implements WishlistItemService {
	
	@Autowired
	private WishlistItemDAO wishlistItemDAO;
	
	@Autowired
	private WishlistService wishlistService;
	
	@Override
	public List selectAll() {
		return wishlistItemDAO.selectAll();
	}

	@Override
	public List selectByWishlistId(long wishlist_id) {
		return wishlistItemDAO.selectByWishlistId(wishlist_id);
	}
	
	
	@Override
	@Transactional
	public void deleteByWishlistId(long wishlist_id) throws WishlistItemException{
		wishlistItemDAO.deleteByWishlistId(wishlist_id);
	}

	@Override
	public boolean isWished(long user_id, long asset_id) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_id", user_id);
	    paramMap.put("asset_id", asset_id);
		return wishlistItemDAO.existsByUserIdAndAssetId(paramMap);
	}

	@Override
	@Transactional
	public void removeFromWishlist(long wishlist_id, long asset_id) throws WishlistItemException{
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("wishlist_id", wishlist_id);
	    paramMap.put("asset_id", asset_id);
	    wishlistItemDAO.deleteByWishlistIdAndAssetId(paramMap);
	}

	@Override
	public int countByAssetId(long asset_id) {
		return wishlistItemDAO.countByAssetId(asset_id);
	}

	@Override
	public boolean isContained(long wishlist_id, long asset_id) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("wishlist_id", wishlist_id);
	    paramMap.put("asset_id", asset_id);
		return wishlistItemDAO.existsByWishlistIdAndAssetId(paramMap);
	}

	@Override
	@Transactional
	public void updateWishlistMapping(long user_id, long asset_id, List<Long> list_ids) throws WishlistItemException{
		
		// 1. 해당 에셋을 포함하는 유저의 목록을 전부 찾아서
		List<Wishlist> lists = wishlistService.selectByUserId(user_id);
		List<Long> ids = lists
					.stream()
					.map(Wishlist::getWishlist_id)
					.collect(Collectors.toList());
		
		// 2. 레코드 삭제
		for(long wishlist_id : ids) {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("wishlist_id", wishlist_id);
		    paramMap.put("asset_id", asset_id);
			wishlistItemDAO.deleteByWishlistIdAndAssetId(paramMap);
		}
		
		// 3. 선택한 목록에 에셋 추가 
		if(list_ids == null) return;
		
		for(long wishlist_id : list_ids) {
			WishlistItem item = new WishlistItem();
			
			Wishlist wishlist = new Wishlist();
			wishlist.setWishlist_id(wishlist_id);
			item.setWishlist(wishlist);
			
			Asset asset = new Asset();
			asset.setAsset_id(asset_id);
			
			item.setAsset(asset);
		    wishlistItemDAO.insert(item);
		}
		
	}
}
