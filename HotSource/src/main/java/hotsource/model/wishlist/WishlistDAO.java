package hotsource.model.wishlist;

import java.util.List;

import hotsource.domain.Wishlist;

public interface WishlistDAO {
	public void insert(Wishlist wishlist);
	public List selectAll();
	public Wishlist select(long wishlist_id);
	public List selectByUserId(long user_id);
}
