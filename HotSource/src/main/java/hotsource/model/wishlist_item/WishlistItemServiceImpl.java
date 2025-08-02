package hotsource.model.wishlist_item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void deleteByWishlistId(long wishlist_id) throws WishlistItemException{
		wishlistItemDAO.deleteByWishlistId(wishlist_id);
	}
}
