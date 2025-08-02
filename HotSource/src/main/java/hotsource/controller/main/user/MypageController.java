package hotsource.controller.main.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.User;
import hotsource.model.keyword.KeywordService;
import hotsource.model.user.UserService;
import hotsource.model.user_keyword_mapping.UserKeywordMappingService;
import hotsource.util.FileManager;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {

    private final FileManager fileManager;

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserKeywordMappingService userKeywordService;
	
	@Autowired
	private KeywordService keywordService;

    MypageController(FileManager fileManager) {
        this.fileManager = fileManager;
    }

	@GetMapping("/user/mypage")
	public String myAccount(@RequestParam(value="mymenu", defaultValue="info") String mymenu, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List keywordList = keywordService.selectAll();
		List userKeywordList = userKeywordService.selectByUserId(user.getUser_id());
		
		String contentUrl = "info.jsp";
		
		switch (mymenu) {
			case "order": contentUrl = "order.jsp"; break;
			case "security": contentUrl = "security.jsp"; break;
			case "review": contentUrl = "review.jsp"; break;
			case "resource": contentUrl = "resource.jsp"; break;
			case "subscription": contentUrl = "subscription.jsp"; break;
		}
		
		model.addAttribute("mymenu", mymenu);
		model.addAttribute("myContent", contentUrl);
		model.addAttribute("keywordList", keywordList);
		model.addAttribute("userKeywordList", userKeywordList);
		
		return "user/mypage/index";
	}

	// 기본 정보(닉네임, 프로필 이미지) 수정 처리 
	@PostMapping("/user/mypage/basic")
	@ResponseBody
	public String updateBasic(
		    @RequestParam("user_id") long user_id,
		    @RequestParam("user_nickname") String nickname,
		    @RequestParam("profile_img_url") String profile_img_url,
		    @RequestParam(value = "photo", required = false) MultipartFile photo,
		    HttpServletRequest request, HttpSession session) {
		
		String savePath = request.getServletContext().getRealPath("/data");
		
		User user = new User();
		user.setUser_id(user_id);
		user.setUser_nickname(nickname);
		user.setPhoto(photo);
		
		String result = "";
		try {
			userService.updateBasic(user, savePath);
			result = "success";
			if (photo != null && !photo.isEmpty())
				fileManager.remove(profile_img_url, savePath);
		} catch (Exception e) {
		    e.printStackTrace();
		    result = "fail";
			if (photo != null && !photo.isEmpty())
				fileManager.remove(user.getProfile_img_url(), savePath);
		} finally {
			User newUser = userService.select(user_id);
		    session.setAttribute("user", newUser);
		}
		
		return result;
	}
	
	// 키워드 수정 처리
	@PostMapping("/user/mypage/keyword")
	@ResponseBody
	public String updateKeyword(@RequestBody List<String> request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		try {
			userKeywordService.delete(user.getUser_id());
			for (String keyword : request)
				userKeywordService.insert(user, keyword);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		} finally {
			User newUser = userService.select(user.getUser_id());
		    session.setAttribute("user", newUser);
		}
	}
}
