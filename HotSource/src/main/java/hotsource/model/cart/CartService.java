package hotsource.model.cart;

import java.util.List;

import hotsource.domain.Cart;

public interface CartService {
	
	// 특정 유저의 장바구니 목록 가져오기
	public List getCartList(long user_id);
	
//	// 에셋 하나 장바구니에 담기  
	public void addToCart(Cart cart);
	
	public boolean isInCart(long user_id, long asset_id);
	
	// 한 건 삭제 
	public void delete(long cart_id);
	
	//다 건 삭제
	public void deleteSelected(List<Long> cart_ids);
	
}
