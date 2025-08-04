package hotsource.controller.main.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import hotsource.domain.Role;
import hotsource.domain.Seller;
import hotsource.domain.SnsProvider;
import hotsource.domain.User;
import hotsource.model.seller.SellerService;
import hotsource.model.snsprovider.SnsProviderService;
import hotsource.model.user.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user")
public class UserController {

	@Autowired
	@Qualifier("googleAuthService")
	private OAuth20Service googleAuthService;
	
	@Autowired
	@Qualifier("naverAuthService")
	private OAuth20Service naverAuthService;
	
	@Autowired
	@Qualifier("kakaoAuthService")
	private OAuth20Service kakaoAuthService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private SnsProviderService snsProviderService;

	@GetMapping("/login")
	public String getForm() {
		log.debug("logi폼 보여주기");
		return "/user/loginform";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}
	
	@GetMapping("/registform")
	public String getRegistForm() {
		return "user/join";
	}
	
	@PostMapping("/regist")
	public String regist(User user) {
		Role role = new Role();
		SnsProvider snsProvider = new SnsProvider();
		role.setRole_id(1);
		user.setRole(role);
		userService.regist(user);

	    return "redirect:/main/user/login";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public ResponseEntity<?> loginAjax(@RequestBody User user, HttpSession session) {
		try {
		    User obj = userService.login(user);
	
		    if (obj != null) {
		        session.setAttribute("user", obj);
		        loginAndSetSession(session, obj);
	
		        Map<String, Object> result = new HashMap<>();
		        result.put("success", true);
		        result.put("redirectUrl", "/main/index");
		        return ResponseEntity.ok(result);
		    }
		} catch (Exception e) {
			e.printStackTrace();
			log.debug("login Exception :"+ e.getMessage());
		}
		Map<String, Object> error = new HashMap<>();
		error.put("success", false);
		error.put("message", "Invalid credentials");
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
	}


	@PostMapping("/password/check")
	@ResponseBody
	public String checkPassword(@RequestParam String oriPwd, HttpSession session) {
		//User user = (User) session.getAttribute("user");
		User user = userService.select(5);
		if (user != null && userService.checkPassword(user, oriPwd))
			return "match";
		else
			return "notMatch";
	}
	
	@PostMapping("/password/confirm")
	@ResponseBody
	public String confirmPassword(@RequestParam String newPwd, HttpSession session) {
		//User user = (User) session.getAttribute("user");
		User user = userService.select(5);
		if (user != null && userService.confirmPassword(user, newPwd))
			return "isNew";
		else
			return "isNotNew";
	}
	
	@PostMapping("/password/update")
	@ResponseBody
	public String updatePassword(@RequestParam String newPwd, HttpSession session) {
		//User user = (User) session.getAttribute("user");
		User user = userService.select(5);
		if (user != null) {
			userService.updatePassword(user, newPwd);
			return "success";
		} else
			return "fail";
	}
	
	/* --------------------------
	 *  Google Login API
	--------------------------- */
	
	@GetMapping("/google/authurl")
	@ResponseBody
	public String getGoogleAuthUrl() {
		return googleAuthService.getAuthorizationUrl();
	}
	
	@GetMapping("/callback/sns/google")
	public String googleCallback(@RequestParam("code") String code, HttpSession session) throws IOException, InterruptedException, ExecutionException {
		
		OAuth2AccessToken accessToken = googleAuthService.getAccessToken(code);
		
		log.debug("구글이 준 코드는 :"+code);
		log.debug("인증 결과 token은 :"+ accessToken);
		
		// 토큰을 받았다면, Resource Owner의 개인정보 접근 가능 
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://www.googleapis.com/oauth2/v2/userinfo");
		googleAuthService.signRequest(accessToken, request); // 요청시 사용할 토큰 지정
		Response response = googleAuthService.execute(request); // 사용자 정보 요청 시도!
		
		JsonObject json = JsonParser.parseString(response.getBody()).getAsJsonObject();
		
		String email = json.get("email").getAsString();
		String name = json.get("name").getAsString();
		String openid = json.get("id").getAsString();
		log.debug("google OpenId :"+ openid);
		
		User user = null;
		
		user = userService.selectById(openid);
		if(user==null) {
			// 동일한 계정 있는지 체크하는 로직 필요
			
			user = new User();
			
			user.setSnsProvider(snsProviderService.selectByName("google"));
			user.setId(openid);
			user.setUser_email(email);
			user.setUser_name(name);
			user.setUser_nickname(name);
			
			Role role = new Role();
			
			role.setRole_id(1);
			user.setRole(role);
			
			userService.regist(user);
		} 
		session.setAttribute("user", user);
		loginAndSetSession(session, user);
		
		return "redirect:/main/index";
	}
	

	/* --------------------------
	 *  Naver Login API
	--------------------------- */
	
	@GetMapping("/naver/authurl")
	@ResponseBody
	public String getNaverAuthUrl() {
		return naverAuthService.getAuthorizationUrl();
	}
	
	@GetMapping("/callback/sns/naver")
	public String naverCallback(@RequestParam("code") String code, HttpSession session) throws IOException, InterruptedException, ExecutionException {
		
		OAuth2AccessToken accessToken = naverAuthService.getAccessToken(code);
		
		log.debug("네이버 준 코드는 :"+code);
		log.debug("인증 결과 token은 :"+ accessToken);
		
		// 토큰을 받았다면, Resource Owner의 개인정보 접근 가능 
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me");
		naverAuthService.signRequest(accessToken, request); // 요청시 사용할 토큰 지정
		Response response = naverAuthService.execute(request); // 사용자 정보 요청 시도!
		
		JsonObject responseJson = JsonParser.parseString(response.getBody()).getAsJsonObject();
		
		log.debug("responseJson :"+ responseJson);
		JsonObject userJson = responseJson.getAsJsonObject("response");
		
		String id = userJson.get("id").getAsString();
		String email = userJson.get("email").getAsString();
		String name = userJson.get("name").getAsString();
		log.debug("id:"+id);
		log.debug("email:"+email);
		log.debug("name:"+name);
		
		User user = null;
		
		user = userService.selectById(id);
		if(user==null) {
			// 동일한 계정 있는지 체크하는 로직 필요
			
			user = new User();
			
			user.setSnsProvider(snsProviderService.selectByName("naver"));
			user.setId(id);
			user.setUser_email(email);
			user.setUser_name(name);
			user.setUser_nickname(name);
			
			Role role = new Role();
			
			role.setRole_id(1);
			user.setRole(role);
			
			userService.regist(user);
		} 
		session.setAttribute("user", user);
		loginAndSetSession(session, user);
		
		return "redirect:/main/index";
	}
	

	/* --------------------------
	 *  Kakao Login API
	--------------------------- */
	
	@GetMapping("/kakao/authurl")
	@ResponseBody
	public String getKakaoAuthUrl() {
		return kakaoAuthService.getAuthorizationUrl();
	}
	
	@GetMapping("/callback/sns/kakao")
	public String kakaoCallback(@RequestParam("code") String code, HttpSession session) throws IOException, InterruptedException, ExecutionException {
		
		log.debug("kakao code :" + code);
	
		log.debug("kakaoAuthService :"+ kakaoAuthService);
		
		System.out.println("Authorization URL: " + kakaoAuthService.getAuthorizationUrl());
		
		OAuth2AccessToken accessToken = kakaoAuthService.getAccessToken(code);
		
		log.debug("인증 결과 token은 :"+ accessToken);
		
		// 토큰을 받았다면, Resource Owner의 개인정보 접근 가능 
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://kapi.kakao.com/v2/user/me");
		kakaoAuthService.signRequest(accessToken, request); // 요청시 사용할 토큰 지정
		Response response = kakaoAuthService.execute(request); // 사용자 정보 요청 시도!
		
		JsonObject responseJson = JsonParser.parseString(response.getBody()).getAsJsonObject();
		
		log.debug("responseJson :"+ responseJson);
		JsonObject userJson = responseJson.getAsJsonObject("response");
		
		String id = userJson.get("id").getAsString();
		String email = userJson.get("email").getAsString();
		String name = userJson.get("name").getAsString();
		log.debug("id:"+id);
		log.debug("email:"+email);
		log.debug("name:"+name);
		
		User user = null;
		
		user = userService.selectById(id);
		if(user == null) {
			// 동일한 계정 있는지 체크하는 로직 필요
			
			user = new User();
			
			user.setSnsProvider(snsProviderService.selectByName("kakao"));
			user.setId(id);
			user.setUser_email(email);
			user.setUser_name(name);
			user.setUser_nickname(name);
			
			Role role = new Role();
			
			role.setRole_id(1);
			user.setRole(role);
			
			userService.regist(user);
		} 
		session.setAttribute("user", user);
		loginAndSetSession(session, user);
		
		return "redirect:/main/index";
	}
	
	public void loginAndSetSession(HttpSession session, User user) {
	    session.setAttribute("user", user);
	    Seller seller = sellerService.selectByUserId(user.getUser_id());
	    if (seller != null) {
	        session.setAttribute("seller", seller);
	    }
	}
}
