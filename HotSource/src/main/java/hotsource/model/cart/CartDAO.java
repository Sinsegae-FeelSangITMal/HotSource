package hotsource.model.cart;

import java.util.List;
import java.util.Map;

import hotsource.domain.Cart;

public interface CartDAO {
	
	public void insert(Cart cart);
	
	public List selectAll();
	public Cart select(long cart_id);
	public List selectByUserId(long user_id);
	public boolean existsByUserIdAndAssetId(Map<String, Object> paramMap);
	
	public void delete(long cart_id);
	public void deleteByCartIds(List<Long> cart_ids);
	

}
