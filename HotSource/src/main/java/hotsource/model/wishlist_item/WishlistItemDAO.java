package hotsource.model.wishlist_item;

import java.util.List;
import java.util.Map;

public interface WishlistItemDAO {
	public List selectAll();
	public List selectByWishlistId(long wishlist_id);
	public void deleteByWishlistId(long wishlist_id);
	public boolean existsByUserIdAndAssetId(Map<String, Object> paramMap);
	public boolean existsByWishlistIdAndAssetId(Map<String, Object> paramMap);
	public void deleteByWishlistIdAndAssetId(Map<String, Object> paramMap);
	public int countByAssetId(long asset_id);
}
