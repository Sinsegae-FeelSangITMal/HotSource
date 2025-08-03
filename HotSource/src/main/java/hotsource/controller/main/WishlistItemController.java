package hotsource.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hotsource.model.wishlist_item.WishlistItemService;

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
}
