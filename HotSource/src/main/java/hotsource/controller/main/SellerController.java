package hotsource.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.Asset;
import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;
import hotsource.domain.NoticeLike;
import hotsource.domain.Review;
import hotsource.domain.Seller;
import hotsource.model.asset.AssetService;
import hotsource.model.notice.NoticeService;
import hotsource.model.notice_comment.NoticeCommentService;
import hotsource.model.notice_like.NoticeLikeService;
import hotsource.model.review.ReviewService;
import hotsource.model.seller.SellerService;
import hotsource.model.subscribe.SubscribeService;
import hotsource.model.user.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SellerController {

	@Autowired
	private UserService userSerive;
	
	@Autowired
	private SellerService sellerSerive;
	
	@Autowired
	private AssetService assetService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private NoticeCommentService noticeCommentService;
	
	@Autowired
	private NoticeLikeService noticeLikeService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private ReviewService reviewService;
	
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
	public ModelAndView getDetail(long seller_id, long notice_id, long notice_comment_id, long notice_like_id, Model model) {
		ModelAndView mav = new ModelAndView("main/seller/detail");
		
		//3단계
		Seller seller = sellerSerive.selectBySellerId(seller_id);
		Notice notice = noticeService.select(notice_id);
		NoticeComment noticeComment = noticeCommentService.select(notice_comment_id);
		NoticeLike noticeLike = noticeLikeService.select(notice_like_id);
		
		// 구독자 수 count
		int subscribeCount = subscribeService.selectSubCount(seller_id);
		
		// 작가의 총 에셋 수 count
		int assetCount = assetService.selectCount(seller_id);
		
		// 작가의 평균 리뷰 평점
		//double assetRate = reviewService.selectAvgRate(seller_id);
		double assetRate = 0.0;
		if (seller.getAssetList() != null) {
		    assetRate = seller.getAssetList().stream()
		        .filter(asset -> asset.getReviewList() != null)
		        .flatMap(asset -> asset.getReviewList().stream())
		        .mapToDouble(Review::getRate)
		        .average()
		        .orElse(0.0);
		}
		
		log.debug("assetRate : " + assetRate);
		
		//4단계: 저장 
		model.addAttribute("seller", seller);
		model.addAttribute("notice", notice);
		model.addAttribute("noticeComment", noticeComment);		
		model.addAttribute("noticeLike", noticeLike);		
		model.addAttribute("subscribeCount", subscribeCount);		
		model.addAttribute("assetCount", assetCount);
		model.addAttribute("assetRate", assetRate);

		return mav;
	}
}
