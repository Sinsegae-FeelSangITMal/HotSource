package hotsource.controller.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.User;
import hotsource.domain.Wishlist;
import hotsource.exception.WishlistException;
import hotsource.model.wishlist.WishlistService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WishlistController {
	
	@Autowired
	private WishlistService wishlistService;
	
	@PostMapping("/wishlist/regist")
	@ResponseBody
	public String regist(Wishlist wishlist, HttpSession session) {
		log.debug("컨트롤러 list_name=" + wishlist.getList_name());
		User user = (User)session.getAttribute("user");
		wishlist.setUser(user);
		try {
			wishlistService.regist(wishlist);
		} catch (WishlistException e) {
			e.printStackTrace();
		}
		
		return "ok";
	}
	
	@GetMapping("/wishlist")
	public ModelAndView getWishlists(HttpSession session) {		
		User user = (User)session.getAttribute("user");
		List<Wishlist> list = wishlistService.selectByUserId(user.getUser_id());  //로그인 사용자 id로 수정 필요
		
		log.debug("컨트롤러 진입" + user.getUser_id());
		ModelAndView mav = new ModelAndView("main/wishlist/list");
		mav.addObject("wishlists", list);
		
		return mav;
	}
	
	@GetMapping("/wishlist/detail")
	public ModelAndView getWishlist(@RequestParam long wishlist_id, HttpSession session) {
		ModelAndView mav = new ModelAndView("main/wishlist/detail");
		Wishlist wishlist = wishlistService.select(wishlist_id);
		
		User loginUser = (User)session.getAttribute("user");  //로그인한 유저의 찜 목록이 아니라면 
		if(loginUser.getUser_id() != wishlist.getUser().getUser_id()) {
			//예외 발생시키고 ... 흠
			// 다시 본인 찜 목록으로 돌아가기 
		}
		
		mav.addObject("wishlist", wishlist);
		return mav;
	}
	
	@PostMapping("/wishlist/update")
	@ResponseBody
	public String updateWishlist(Wishlist wishlist) {
		wishlistService.update(wishlist);
		
		return "ok";
	}
	
	@PostMapping("/wishlist/delete")
	public String deleteWishlist(long wishlist_id) {
		wishlistService.delete(wishlist_id);
		return "redirect:/main/wishlist";
	}
	
}
