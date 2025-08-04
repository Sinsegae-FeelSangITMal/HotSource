package hotsource.model.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Cart;
import hotsource.exception.CartException;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public List getCartList(long user_id) {
		return cartDAO.selectByUserId(user_id);
	}
	
	@Override
	@Transactional
	public void addToCart(Cart cart) throws CartException{
		cartDAO.insert(cart);
	}

	@Override
	@Transactional
	public void delete(long cart_id) throws CartException{
		cartDAO.delete(cart_id);
	}

	@Override
	@Transactional
	public void deleteSelected(List<Long> cart_ids) throws CartException{
		if(cart_ids.size() < 1) {
			throw new CartException("선택 항목이 없습니다.");
		}
		cartDAO.deleteByCartIds(cart_ids);
	}

	@Override
	public boolean isInCart(long user_id, long asset_id) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_id", user_id);
		paramMap.put("asset_id", asset_id);
		
		return cartDAO.existsByUserIdAndAssetId(paramMap);
	}


}
