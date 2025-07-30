package hotsource.model.review_like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewLikeServiceImpl implements ReviewLikeService{
	
	@Autowired
	private ReviewLikeService reviewLikeService;
	
	@Override
	public List selectByReviewId(long review_id) {
		return reviewLikeService.selectByReviewId(review_id);
	}
}
