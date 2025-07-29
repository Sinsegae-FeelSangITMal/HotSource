package hotsource.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@Autowired
	
	@RequestMapping(value= "/index", method=RequestMethod.GET)
	public ModelAndView getMain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/index");
		
		return mav;
	}

	// 종합 검색
	@RequestMapping(value="/search")
	public String searchAll() {
		return "main/search_all";
	}
	
	// 이미지 상품 리스트
	@RequestMapping(value="/images")
	public String imageList() {
		return "main/search_resource";
	}
	
	// 사운드 상품 리스트
	@RequestMapping(value="/sounds")
	public String soundList() {
		return "main/search_resource";
	}
	
}
