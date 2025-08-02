package hotsource.model.wishlist_item;

import java.util.List;

public interface WishlistItemDAO {
	public List selectAll();
	public List selectByWishlistId(long wishlist_id);
	public void deleteByWishlistId(long wishlist_id);
}
