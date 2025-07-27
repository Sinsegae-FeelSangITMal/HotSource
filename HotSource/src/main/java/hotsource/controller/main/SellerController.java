package hotsource.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.Seller;
import hotsource.model.seller.SellerService;

@Controller
public class SellerController {
	
	@Autowired
	private SellerService sellerSerive;
	
	// 작가 페이지
	@RequestMapping(value= "/seller", method=RequestMethod.GET)
	public ModelAndView getMain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/seller");
		
		return mav;
	}
	
	//상세요청 처리 
	@GetMapping("/seller/detail")
	public ModelAndView getDetail(int seller_id, Model model) {
		ModelAndView mav = new ModelAndView("main/seller/detail");
		
		//3단계: 최상위 카테고리 가져오기, 모든 상품 가져오기 
		Seller seller = sellerSerive.select(seller_id);
		
		//4단계: 저장 
		model.addAttribute("seller", seller);
		

		return mav;
	}
}
