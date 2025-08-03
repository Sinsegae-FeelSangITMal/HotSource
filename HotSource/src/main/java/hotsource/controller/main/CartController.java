package hotsource.controller.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.Cart;
import hotsource.domain.User;
import hotsource.exception.CartException;
import hotsource.model.asset.AssetService;
import hotsource.model.cart.CartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired 
	private AssetService assetService;

	@GetMapping("/cart")
	public ModelAndView getCart(HttpSession session) {
		ModelAndView mav = new ModelAndView("main/cart/list");
		User loginUser = (User)session.getAttribute("user");
		log.debug("login id=" + loginUser.getUser_id());
		
		List<Cart> carts = cartService.getCartList(loginUser.getUser_id());   // 수정 필요: 로그인 유저 id
		List<Integer> discountList = new ArrayList<>();		
		
		for(int i = 0; i < carts.size(); i++) {
			discountList.add(assetService.getDiscountPrice(carts.get(i).getAsset()));
		}
		
		mav.addObject("cartList", carts);
		mav.addObject("discountList", discountList);
		
		return mav;
	} 
	
	@PostMapping("/cart/delete")
	@ResponseBody
	public String removeCartItem(int cart_id) {
		try {
			cartService.delete(cart_id);
		} catch (CartException e) {
			
			e.printStackTrace();
		}
		
		return "ok";
	}
	
	@PostMapping("/cart/deleteSelected")
	@ResponseBody
	public String removeMultipleCartItem(@RequestParam("cart_ids") List<Long> cart_ids) {
		try {
			cartService.deleteSelected(cart_ids);
		} catch (CartException e) {
			e.printStackTrace();
		}
		
		return "ok";
	}
	
}

