package hotsource.controller.main.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/mypage")
public class MypageController {


	@GetMapping
	public String myAccount(@RequestParam(value="mymenu", defaultValue="info") String mymenu, Model model) {
		String contentUrl = "info.jsp";
		
		switch (mymenu) {
			case "order": contentUrl = "order.jsp"; break;
			case "review": contentUrl = "review.jsp"; break;
			case "resource": contentUrl = "resource.jsp"; break;
			case "subscription": contentUrl = "subscription.jsp"; break;
		}
		
		model.addAttribute("mymenu", mymenu);
		model.addAttribute("myContent", contentUrl);
		
		return "user/mypage/index";
	}
	
}
