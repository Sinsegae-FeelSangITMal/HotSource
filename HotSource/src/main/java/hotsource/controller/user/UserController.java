package hotsource.controller.user;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mysql.cj.Session;

import hotsource.domain.SnsProvider;
import hotsource.domain.User;
import hotsource.model.user.SnsProviderService;
import hotsource.model.user.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {

	@Autowired
	private OAuth20Service googleAuthService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SnsProviderService snsProviderService;
	
	@GetMapping("/login")
	public String getForm() {
		return "/user/loginform";
	}
	
	@GetMapping("/google/authurl")
	@ResponseBody
	public String getGoogleAuthUrl() {
		return googleAuthService.getAuthorizationUrl();
	}
	
	@GetMapping("callback/sns/google")
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
		
		User user = null;
		try {
			// 동일한 계정 있는지 체크하는 로직 필요
			
			user = new User();
			
			user.setSnsProvider(snsProviderService.selectByName(name));
			user.setId(openid);
			user.setUser_email(email);
			user.setUser_name(name);
			// user.setRole()나중에 구현
			
			userService.regist(user);
		} catch(Exception e) {
			e.printStackTrace();
			log.debug("동일한 유저 발견");
		}
		session.setAttribute("user", user);
		
		return "redirect:/main/index";
	}
}
