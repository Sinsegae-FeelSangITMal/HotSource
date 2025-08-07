package hotsource.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		String uri = request.getRequestURI();
		
		//로그인 검증 필요 없는 uri 
		if(
			//로그인
			uri.equals("/main/user/login") ||	
			uri.equals("/main/user/logout") ||	
			uri.equals("/main/user/registform") ||
			uri.equals("/main/user/regist") ||
			
			//sns 로그인
			uri.equals("/main/user/google/authurl") ||
			uri.equals("/main/user/callback/sns/google") ||
			uri.equals("/main/user/naver/authurl") ||
			uri.equals("/main/user/callback/sns/naver") ||
			uri.equals("/main/user/kakao/authurl") ||
			uri.equals("/main/user/callback/sns/kakao") ||
			
			
			uri.equals("/main/user/regist") ||
			uri.equals("/main/user/regist") ||
			
			// 메인 
			uri.equals("/main/index") ||   
			uri.equals("/main/images") ||
			uri.equals("/main/sounds") ||
			uri.equals("/main/sale") ||
			
			// 에셋 상세 페이지
			uri.equals("/main/asset/detail") ||
			
			// 판매자 프로필 페이지
			uri.equals("/main/seller/detail") 
			
		) {
			chain.doFilter(req, res);
			return;
		}
			

		// 현재 들어오는 요청객체가 세션정보를 보유하지 않고 있다면 새로운 세션 객체를 만들어서 반환해줌
		HttpSession session = request.getSession();
		boolean loggined = session.getAttribute("user") != null;
		
		if(loggined) {
			chain.doFilter(req, res);
			return;
		} else {
			HttpServletResponse response = (HttpServletResponse) res;
			response.sendRedirect("/main/user/login");
		}
	}

	@Override
	public void destroy() {
		
	}
}
