package hotsource.model.cart;

import java.util.List;

import hotsource.domain.Cart;

public interface CartDAO {
	
	public void insert(Cart cart);
	
	public List selectAll();
	public Cart select(long cart_id);
	public List selectByUserId(long user_id);
	
	public void delete(long cart_id);
	public void deleteByCartIds(List<Long> cart_ids);
	

}
