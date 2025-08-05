package hotsource.controller.seller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.Notice;
import hotsource.domain.Seller;
import hotsource.domain.User;
import hotsource.model.notice.NoticeService;
import hotsource.model.seller.SellerService;
import hotsource.util.Paging;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	SellerService sellerService;
	
	@Autowired
	Paging paging;

	@GetMapping("/notice/list")
	public ModelAndView selectAll(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		List<Notice> allList = noticeService.selectAll();
		int total = allList.size();

		paging.init(total, allList, request);

		int start = paging.getCurPos();
		int end = Math.min(start + paging.getPageSize(), total); // end index는 범위 초과 방지

		List<Notice> noticeList = allList.subList(start, end);

		mav.addObject("noticeList", noticeList);
		mav.addObject("paging", paging);
		mav.setViewName("seller/notice/list");
		
		return mav;
	}
	
	@RequestMapping(value="/notice/registform", method=RequestMethod.GET)
	public String getRegistForm() { 
		return "seller/notice/write";
	}
	
	@RequestMapping(value="/notice/regist", method=RequestMethod.POST)
	public ModelAndView regist(Notice notice, HttpSession session	) {
		ModelAndView mav = new ModelAndView();
		
		try {
	        User user = (User) session.getAttribute("user");
	        if (user != null) {
	            Seller seller = sellerService.selectByUserId(user.getUser_id()); // ← 여기가 핵심
	            if (seller != null) {
	                notice.setSeller(seller);
	            } else {
	                throw new RuntimeException("해당 사용자에 대한 판매자 정보가 없습니다.");
	            }
	        } else {
	            throw new RuntimeException("로그인된 사용자 정보가 없습니다.");
	        }

	        noticeService.regist(notice);
	        mav.setViewName("redirect:/seller/notice/list");
	    } catch(Exception e) {
	        log.error("등록 실패", e); 
	        mav.addObject("e", e);
	        mav.setViewName("seller/error/result");
	    }
	    return mav; 
	}
	// 글 확인 페이지 요청
	@GetMapping("/notice/detail")
	public ModelAndView getDetail(int notice_id) {
		ModelAndView mav = new ModelAndView();
		
		Notice notice = noticeService.select(notice_id);
		log.debug("넘겨온 notice_id " + notice_id);
		log.debug("선택된 notice : " + notice);
		mav.addObject("notice", notice);
		mav.setViewName("/seller/notice/detail");
		
		return mav;
	}
	
	// 글 수정 요청 처리

	
	// 글 삭제 요청 처리
	
}
