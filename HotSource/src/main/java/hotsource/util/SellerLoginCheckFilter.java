package hotsource.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SellerLoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession(false);
		log.debug("필터 동작함");
		
		String uri = request.getRequestURI();
		if (uri.startsWith(request.getContextPath() + "/seller")) {
		    // /seller 이하 경로일 때만 로그인 체크
		    if (session == null || session.getAttribute("user") == null) {
		        log.debug("로그인이 필요합니다.");
		        res.setContentType("text/html; charset=UTF-8");
		        res.getWriter().write("<script>alert('로그인이 필요합니다.'); location.href='/user/login';</script>");
		        return;
		    }
		}
		chain.doFilter(req, res);
		
	}

	@Override
	public void destroy() {
		
	}

	
}
