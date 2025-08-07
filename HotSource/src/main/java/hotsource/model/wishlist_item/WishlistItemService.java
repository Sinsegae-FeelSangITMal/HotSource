package hotsource.model.wishlist_item;

import java.util.List;

public interface WishlistItemService {
	public List selectAll();
	public List selectByWishlistId(long wishlist_id);
	public void deleteByWishlistId(long wishlist_id);  //찜목록 에셋 전체 삭제
	public boolean isWished(long user_id, long asset_id);
	public boolean isContained(long wishlist_id, long asset_id);
	public void removeFromWishlist(long wishlist_id, long asset_id); //찜목록의 특정 에셋 삭제 
	public int countByAssetId(long asset_id);
	public void updateWishlistMapping(long user_id, long asset_id, List<Long> list_ids);  // list_ids에 있는 찜 목록만 에셋을 포함하도록 수정
	
}
