package hotsource.model.wishlist_item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.exception.WishlistItemException;

@Service
public class WishlistItemServiceImpl implements WishlistItemService {
	
	@Autowired
	private WishlistItemDAO wishlistItemDAO;
	
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
}
