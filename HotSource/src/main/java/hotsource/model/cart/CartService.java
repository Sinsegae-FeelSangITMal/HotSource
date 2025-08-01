package hotsource.model.cart;

import java.util.List;

import hotsource.domain.Cart;

public interface CartService {
//	
//	public List selectAll();
//	public Cart select(int cart_id);
	
	// 특정 유저의 장바구니 목록 가져오기
	public List getCartList(long user_id);
	
//	// 에셋 하나 장바구니에 담기  
//	public void addToCart(Cart cart);
//	
//	// 비로그인 상태에서 에셋 담은 후 로그인할 시 유저의 기존 장바구니에 합치기 
//	public void addAllToCart(List<Cart> carts);
//	
	// 한 건 삭제 
	public void delete(long cart_id);
	
	//다 건 삭제
	public void deleteSelected(List<Long> cart_ids);
	
}
