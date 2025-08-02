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
	    HttpServletResponse response = (HttpServletResponse) res; // 형변환 필요
	    HttpSession session = request.getSession(false);
	    log.debug("필터 동작함");

	    String uri = request.getRequestURI();

	    if (uri.startsWith(request.getContextPath() + "/seller")) {

	        Object user = session != null ? session.getAttribute("user") : null;
	        Object seller = session != null ? session.getAttribute("seller") : null;

	        // 1. 로그인 안 되어있으면 로그인 페이지로
	        if (user == null) {
	            log.debug("로그인이 필요합니다.");
	            res.setContentType("text/html; charset=UTF-8");
	            res.getWriter().write("<script>alert('로그인이 필요합니다.'); location.href='/main/user/login';</script>");
	            return;
	        }

	        // 2. 로그인은 했지만 seller 등록이 안 된 경우 → seller 등록 페이지로
	        if (seller == null &&
        	    !uri.equals(request.getContextPath() + "/seller/create") &&
        	    !uri.equals(request.getContextPath() + "/seller/sellerCreate")) {

        	    log.debug("판매자 등록이 필요합니다.");
        	    res.setContentType("text/html; charset=UTF-8");
        	    res.getWriter().write("<script>alert('판매자 등록이 필요합니다.'); location.href='/seller/create';</script>");
        	    return;
        	}

	    }

	    chain.doFilter(req, res);
	}


	@Override
	public void destroy() {
		
	}

	
}
