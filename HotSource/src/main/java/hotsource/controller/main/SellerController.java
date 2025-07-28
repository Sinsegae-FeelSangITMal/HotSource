package hotsource.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;
import hotsource.domain.NoticeLike;
import hotsource.domain.Seller;
import hotsource.model.notice.NoticeService;
import hotsource.model.notice_comment.NoticeCommentService;
import hotsource.model.notice_like.NoticeLikeService;
import hotsource.model.seller.SellerService;
import hotsource.model.user.UserService;

@Controller
public class SellerController {

	@Autowired
	private UserService userSerive;
	
	@Autowired
	private SellerService sellerSerive;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private NoticeCommentService noticeCommentService;
	
	@Autowired
	private NoticeLikeService noticeLikeService;
	
	// 작가 페이지
	@RequestMapping(value= "/seller", method=RequestMethod.GET)
	public ModelAndView getMain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/seller/seller");
		
		return mav;
	}
	
	//상세요청 처리 
	@GetMapping("/seller/detail")
	@ResponseBody
	public ModelAndView getDetail(int seller_id, int notice_id, int notice_comment_id, int notice_like_id, Model model) {
		ModelAndView mav = new ModelAndView("main/seller/detail");
		
		//3단계
		Seller seller = sellerSerive.select(seller_id);
		Notice notice = noticeService.select(notice_id);
		NoticeComment noticeComment = noticeCommentService.select(notice_comment_id);
		NoticeLike noticeLike = noticeLikeService.select(notice_like_id);
		
		//4단계: 저장 
		model.addAttribute("seller", seller);
		model.addAttribute("notice", notice);
		model.addAttribute("noticeComment", noticeComment);		
		model.addAttribute("noticeLike", noticeLike);		

		return mav;
	}
}
