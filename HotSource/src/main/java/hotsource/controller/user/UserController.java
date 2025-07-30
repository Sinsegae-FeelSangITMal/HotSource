package hotsource.controller.user;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import hotsource.domain.User;
import hotsource.model.snsprovider.SnsProviderService;
import hotsource.model.user.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
//
//	@Autowired
//	@Qualifier("googleAuthService")
//	private OAuth20Service googleAuthService;
//	
//	@Autowired
//	@Qualifier("naverAuthService")
//	private OAuth20Service naverAuthService;
//	
//	@Autowired
//	@Qualifier("kakaoAuthService")
//	private OAuth20Service kakaoAuthService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SnsProviderService snsProviderService;

	@GetMapping("/login")
	public String getForm() {
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
		userService.regist(user);

	    return "redirect:/user/login";
	}
	
	@PostMapping("/login")
	public String homeLogin(User user, HttpSession session) {
		User obj = userService.login(user);
		session.setAttribute("user", obj);
		
		return "redirect:/main/index";
	}
//
//	
//	
//	/* --------------------------
//	 *  Google Login API
//	--------------------------- */
//	
//	@GetMapping("/google/authurl")
//	@ResponseBody
//	public String getGoogleAuthUrl() {
//		return googleAuthService.getAuthorizationUrl();
//	}
//	
//	@GetMapping("callback/sns/google")
//	public String googleCallback(@RequestParam("code") String code, HttpSession session) throws IOException, InterruptedException, ExecutionException {
//		
//		OAuth2AccessToken accessToken = googleAuthService.getAccessToken(code);
//		
//		log.debug("구글이 준 코드는 :"+code);
//		log.debug("인증 결과 token은 :"+ accessToken);
//		
//		// 토큰을 받았다면, Resource Owner의 개인정보 접근 가능 
//		OAuthRequest request = new OAuthRequest(Verb.GET, "https://www.googleapis.com/oauth2/v2/userinfo");
//		googleAuthService.signRequest(accessToken, request); // 요청시 사용할 토큰 지정
//		Response response = googleAuthService.execute(request); // 사용자 정보 요청 시도!
//		
//		JsonObject json = JsonParser.parseString(response.getBody()).getAsJsonObject();
//		
//		String email = json.get("email").getAsString();
//		String name = json.get("name").getAsString();
//		String openid = json.get("id").getAsString();
//		
//		User user = null;
//		
//		user = userService.selectById(openid);
//		if(user==null) {
//			// 동일한 계정 있는지 체크하는 로직 필요
//			
//			user = new User();
//			
//			user.setSnsProvider(snsProviderService.selectByName(name));
//			user.setId(openid);
//			user.setUser_email(email);
//			user.setUser_name(name);
//			// user.setRole()나중에 구현
//			
//			userService.regist(user);
//		} 
//		session.setAttribute("user", user);
//		
//		return "redirect:/main/index";
//	}
//	
//
//	/* --------------------------
//	 *  Naver Login API
//	--------------------------- */
//	
//	@GetMapping("/naver/authurl")
//	@ResponseBody
//	public String getNaverAuthUrl() {
//		return naverAuthService.getAuthorizationUrl();
//	}
//	
//	@GetMapping("callback/sns/naver")
//	public String naverCallback(@RequestParam("code") String code, HttpSession session) throws IOException, InterruptedException, ExecutionException {
//		
//		OAuth2AccessToken accessToken = naverAuthService.getAccessToken(code);
//		
//		log.debug("네이버 준 코드는 :"+code);
//		log.debug("인증 결과 token은 :"+ accessToken);
//		
//		// 토큰을 받았다면, Resource Owner의 개인정보 접근 가능 
//		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me");
//		naverAuthService.signRequest(accessToken, request); // 요청시 사용할 토큰 지정
//		Response response = naverAuthService.execute(request); // 사용자 정보 요청 시도!
//		
//		JsonObject responseJson = JsonParser.parseString(response.getBody()).getAsJsonObject();
//		
//		log.debug("responseJson :"+ responseJson);
//		JsonObject userJson = responseJson.getAsJsonObject("response");
//		
//		String id = userJson.get("id").getAsString();
//		String email = userJson.get("email").getAsString();
//		String name = userJson.get("name").getAsString();
//		log.debug("id:"+id);
//		log.debug("email:"+email);
//		log.debug("name:"+name);
//		
//		User user = null;
//		
//		user = userService.selectById(id);
//		if(user==null) {
//			// 동일한 계정 있는지 체크하는 로직 필요
//			
//			user = new User();
//			
//			user.setSnsProvider(snsProviderService.selectByName(name));
//			user.setId(id);
//			user.setUser_email(email);
//			user.setUser_name(name);
//			
//			userService.regist(user);
//		} 
//		session.setAttribute("user", user);
//		
//		return "redirect:/main/index";
//	}
//	
//
//	/* --------------------------
//	 *  Kakao Login API
//	--------------------------- */
//	
//	@GetMapping("/kakao/authurl")
//	@ResponseBody
//	public String getKakaoAuthUrl() {
//		return kakaoAuthService.getAuthorizationUrl();
//	}
//	
//	@GetMapping("callback/sns/kakao")
//	public String kakaoCallback(@RequestParam("code") String code, HttpSession session) throws IOException, InterruptedException, ExecutionException {
//		
//		log.debug("kakao code :" + code);
//	
//		log.debug("kakaoAuthService :"+ kakaoAuthService);
//		
//		System.out.println("Authorization URL: " + kakaoAuthService.getAuthorizationUrl());
//		
//		OAuth2AccessToken accessToken = kakaoAuthService.getAccessToken(code);
//		
//		log.debug("인증 결과 token은 :"+ accessToken);
//		
//		// 토큰을 받았다면, Resource Owner의 개인정보 접근 가능 
//		OAuthRequest request = new OAuthRequest(Verb.GET, "https://kapi.kakao.com/v2/user/me");
//		kakaoAuthService.signRequest(accessToken, request); // 요청시 사용할 토큰 지정
//		Response response = kakaoAuthService.execute(request); // 사용자 정보 요청 시도!
//		
//		JsonObject responseJson = JsonParser.parseString(response.getBody()).getAsJsonObject();
//		
//		log.debug("responseJson :"+ responseJson);
//		JsonObject userJson = responseJson.getAsJsonObject("response");
//		
//		String id = userJson.get("id").getAsString();
//		String email = userJson.get("email").getAsString();
//		String name = userJson.get("name").getAsString();
//		log.debug("id:"+id);
//		log.debug("email:"+email);
//		log.debug("name:"+name);
//		
//		User user = null;
//		
//		user = userService.selectById(id);
//		if(user == null) {
//			// 동일한 계정 있는지 체크하는 로직 필요
//			
//			user = new User();
//			
//			user.setSnsProvider(snsProviderService.selectByName(name));
//			user.setId(id);
//			user.setUser_email(email);
//			user.setUser_name(name);
//			
//			userService.regist(user);
//		} 
//		session.setAttribute("user", user);
//		
//		return "redirect:/main/index";
//	}
}
