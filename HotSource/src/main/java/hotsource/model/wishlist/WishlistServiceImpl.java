package hotsource.model.wishlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Wishlist;
import hotsource.exception.WishlistException;
import hotsource.model.wishlist_item.WishlistItemDAO;
import hotsource.model.wishlist_item.WishlistItemService;

@Service
public class WishlistServiceImpl implements WishlistService {
	
	@Autowired
	private WishlistDAO wishlistDAO;
	
	@Autowired
	private WishlistItemService wishlistItemService;
	
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
	
	
}
