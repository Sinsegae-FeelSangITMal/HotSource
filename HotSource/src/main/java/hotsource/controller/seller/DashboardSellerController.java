package hotsource.controller.seller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.Seller;
import hotsource.domain.User;
import hotsource.exception.SellerException;
import hotsource.model.seller.SellerService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DashboardSellerController {
	
	@Autowired
	private SellerService sellerService;

	@GetMapping("/create")
	public String getSellerCreate() {
		return "/seller/seller_regist";
	}
	
	@PostMapping("/sellerCreate")
	public ModelAndView sellerCreate(
	    Seller seller,
	    HttpSession session, HttpServletRequest request) {

	    ModelAndView mav = new ModelAndView();

	    try {
	        // 임시로 파일 이름만 저장 (실제로는 저장 후 경로 저장해야 함)
//	        String fileName = file.getOriginalFilename();
//	        seller.setProfile_img_url(fileName);

	        // 세션 사용자 연동
	        User user = (User) session.getAttribute("user");
	        seller.setUser(user);
	        
	        String savePath = request.getServletContext().getRealPath("/data");
	        
	        try {
	        	sellerService.regist(seller, savePath);
	        } catch(SellerException e) {
//	        	sellerService.remove(seller, savePath);
	        	e.printStackTrace();
	        }
	        session.setAttribute("seller", seller);
	        
	        mav.setViewName("redirect:/seller/dashboard/assetList?seller_id="+seller.getSeller_id());

	    } catch(Exception e) {
	        log.error("등록 실패", e);
	        mav.addObject("e", e);
	        mav.setViewName("create");
	    }

	    return mav;
	}

}
