package hotsource.controller.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hotsource.domain.User;
import hotsource.model.wishlist_item.WishlistItemService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WishlistItemController {

	@Autowired
	private WishlistItemService wishlistItemService;
	
	@PostMapping("/wishlist/item/delete")
	@ResponseBody
	public String removeFromWishlist(long wishlist_id, long asset_id) {
		wishlistItemService.removeFromWishlist(wishlist_id, asset_id);
		return "ok";
	}
	
	@PostMapping("/wishlist/item/add")
	@ResponseBody
	public Map<String, Object> updateWishlistMapping( 
			@RequestParam long asset_id, 
			@RequestParam(value = "list_ids", required = false) List<Long> list_ids,
			HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		wishlistItemService.updateWishlistMapping(user.getUser_id(),  asset_id, list_ids);
		boolean isWished = wishlistItemService.isWished(user.getUser_id(), asset_id);
		Map<String, Object> res = new HashMap<>();
		res.put("isWished", isWished);
		return res;
	}
}
