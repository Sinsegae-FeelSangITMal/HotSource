package hotsource.advice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import hotsource.domain.Seller;
import hotsource.domain.User;
import hotsource.model.topcategory.TopCategoryService;

@ControllerAdvice
public class MainGlobalModelAdvice {

	@Autowired
	private TopCategoryService topCategoryService;
	
	@ModelAttribute("topList")
	public List getTopList() {
		return topCategoryService.selectAll();
	}
	
}