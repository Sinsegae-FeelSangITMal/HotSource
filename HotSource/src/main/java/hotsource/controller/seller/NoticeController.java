package hotsource.controller.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import hotsource.domain.Notice;
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
	public ModelAndView selectAll() {
		ModelAndView mav = new ModelAndView();
		
		log.debug("목록 요청 받음");
	
		// 3단계 : 일 시키기
		List noticeList = noticeService.selectAll();
		
		// 4단계 : 결과 저장
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
	public ModelAndView regist(Notice notice) {
		ModelAndView mav = new ModelAndView();
		
		try {
			noticeService.regist(notice);
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
