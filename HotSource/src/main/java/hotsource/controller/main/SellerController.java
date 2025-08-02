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
	public ModelAndView getDetail(long seller_id, Model model) {
		ModelAndView mav = new ModelAndView("main/seller/detail");
		
		//3단계
		Seller seller = sellerSerive.selectBySellerId(seller_id);

		List<Asset> assetList = assetService.selectBySellerId(seller_id);
		List<Notice> noticeList = noticeService.selectBySellerId(seller_id);

		for (Notice notice : noticeList) {
			// 각각의 공지에 댓글 리스트를 붙여준다
		    List<NoticeComment> commentList = noticeCommentService.selectByNoticeId(notice.getNotice_id());
		    notice.setCommentList(commentList);  // Notice 객체에 commentList 필드가 있어야 함
		    
		    // 각각의 공지에 좋아요 리스트를 붙여준다
		    List<NoticeLike> likeList = noticeLikeService.selectByNoticeId(notice.getNotice_id());
			notice.setLikeList(likeList);  // Notice 객체에 commentList 필드가 있어야 함
		}
		

		
		// 구독자 수 count
		int subscribeCount = subscribeService.selectSubCount(seller_id);
		
		// 작가의 총 에셋 수 count
		int assetCount = assetService.selectCount(seller_id);
		
		// 작가의 평균 리뷰 평점
		double assetRate = 0.0;
		if (seller.getAssetList() != null) {
			// 작가의 전체 에셋 평균 리뷰 별점
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
		model.addAttribute("assetList", assetList);
		model.addAttribute("noticeList", noticeList);
				
		model.addAttribute("subscribeCount", subscribeCount);	
		
		model.addAttribute("assetCount", assetCount);
		model.addAttribute("assetRate", assetRate);

		return mav;
	}
}
