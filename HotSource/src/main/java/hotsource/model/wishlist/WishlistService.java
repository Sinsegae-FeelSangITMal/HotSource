package hotsource.model.wishlist;

import java.util.List;

import hotsource.domain.Wishlist;

public interface WishlistService {
	public List selectAll();
	public Wishlist select(long wishlist_id);
	public List selectByUserId(long user_id);
	
	public void regist(Wishlist wishlist);
	public void update(Wishlist wishlist);
	
}
