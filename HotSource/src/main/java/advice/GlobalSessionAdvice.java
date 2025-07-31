package advice;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import hotsource.domain.Seller;
import hotsource.domain.User;

@ControllerAdvice
public class GlobalSessionAdvice {

	@ModelAttribute("user")
	public User addUserToModel(HttpSession session) {
		return (User) session.getAttribute("user");
	}
	
	@ModelAttribute("seller")
	public Seller addSellerToModel(HttpSession session) {
		return (Seller) session.getAttribute("seller");
	}
}