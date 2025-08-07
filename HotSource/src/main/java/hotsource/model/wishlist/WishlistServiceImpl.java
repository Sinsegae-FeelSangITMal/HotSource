package hotsource.model.wishlist;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Wishlist;
import hotsource.domain.WishlistItem;
import hotsource.exception.WishlistException;
import hotsource.model.asset.AssetService;
import hotsource.model.wishlist_item.WishlistItemService;

@Service
public class WishlistServiceImpl implements WishlistService {
	
	@Autowired
	private WishlistDAO wishlistDAO;
	
	@Autowired
	private WishlistItemService wishlistItemService;
	
	@Autowired
	private AssetService assetService;
	
	@Override
	public List selectAll() {
		return wishlistDAO.selectAll();
	}

	@Override
	public Wishlist select(long wishlist_id) {
		return wishlistDAO.select(wishlist_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return wishlistDAO.selectByUserId(user_id);
	}

	@Override
	@Transactional
	public void regist(Wishlist wishlist)throws WishlistException{
		wishlistDAO.insert(wishlist);
		
	}

	@Override
	@Transactional
	public void update(Wishlist wishlist) throws WishlistException{
		wishlistDAO.update(wishlist);
	}

	@Override
	@Transactional
	public void delete(long wishlist_id) throws WishlistException{
		wishlistItemService.deleteByWishlistId(wishlist_id);
		wishlistDAO.delete(wishlist_id);
	}

	@Override
	public WishlistDetailDTO getDetailWishlist(Wishlist wishlist) {
		WishlistDetailDTO dto = new WishlistDetailDTO();
		dto.setWishlist_id(wishlist.getWishlist_id());
		dto.setList_name(wishlist.getList_name());
		dto.setDescription(wishlist.getDescription());
		
		List<AssetCardDTO> assetCardList = new ArrayList<>();
		long user_id = wishlist.getUser().getUser_id();
		
		for(WishlistItem item : wishlist.getItemList()) {
			AssetCardDTO cardDTO = assetService.buildAssetCardDTO(item.getAsset().getAsset_id(), user_id);
			assetCardList.add(cardDTO);
		}
		
		dto.setAssetList(assetCardList);
		return dto;
	}	
	
}
