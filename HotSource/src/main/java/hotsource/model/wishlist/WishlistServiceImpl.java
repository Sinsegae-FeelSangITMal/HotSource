package hotsource.model.wishlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Wishlist;

@Service
public class WishlistServiceImpl implements WishlistService {
	
	@Autowired
	private WishlistDAO wishlistDAO;
	
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
	public void regist(Wishlist wishlist){
		wishlistDAO.insert(wishlist);
		
	}
}
