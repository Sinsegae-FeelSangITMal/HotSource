package hotsource.controller.main.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotsource.domain.User;
import hotsource.model.keyword.KeywordService;
import hotsource.model.user.UserService;
import hotsource.model.user_keyword_mapping.UserKeywordMappingService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserKeywordMappingService userKeywordService;
	
	@Autowired
	private KeywordService keywordService;

	@GetMapping
	public String myAccount(@RequestParam(value="mymenu", defaultValue="info") String mymenu, Model model) {
		User user = userService.select(1);
		List keywordList = keywordService.selectAll();
		List userKeywordList = userKeywordService.selectByUserId(1);
		
		String contentUrl = "info.jsp";
		
		switch (mymenu) {
			case "order": contentUrl = "order.jsp"; break;
			case "review": contentUrl = "review.jsp"; break;
			case "resource": contentUrl = "resource.jsp"; break;
			case "subscription": contentUrl = "subscription.jsp"; break;
		}
		
		model.addAttribute("mymenu", mymenu);
		model.addAttribute("myContent", contentUrl);
		model.addAttribute("user", user);
		model.addAttribute("keywordList", keywordList);
		model.addAttribute("userKeywordList", userKeywordList);
		
		return "user/mypage/index";
	}
	
}
