package hotsource.controller.seller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import hotsource.domain.Notice;
import hotsource.domain.Seller;
import hotsource.model.notice.NoticeDAO;
import hotsource.model.notice.NoticeService;
import hotsource.util.Paging;

@Slf4j
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	Paging paging;

	@GetMapping("/notice/list")
	public ModelAndView selectAll(HttpSession session, HttpServletRequest request) {
		Seller seller = (Seller) session.getAttribute("seller");
		
		ModelAndView mav = new ModelAndView();
		
		List<Notice> allList = noticeService.selectBySellerId(seller.getSeller_id());
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
	public ModelAndView regist(Notice notice, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
        String savePath = request.getServletContext().getRealPath("/data/notice/");
		
		try {
			Seller seller = (Seller) session.getAttribute("seller");
			log.debug("Notice seller :" + seller);
			notice.setSeller(seller);
			noticeService.regist(notice, savePath+notice.getNotice_id());
			mav.setViewName("redirect:/seller/notice/list");
		} catch(Exception e) {
			log.error("등록 실패", e.getMessage()); 
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
