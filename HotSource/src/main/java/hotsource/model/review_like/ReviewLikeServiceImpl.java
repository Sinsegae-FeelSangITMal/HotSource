package hotsource.model.review_like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.ReviewLike;
import hotsource.exception.ReviewLikeException;

@Service
public class ReviewLikeServiceImpl implements ReviewLikeService{
	
	@Autowired
	private ReviewLikeDAO reviewLikeDAO;
	
	@Override
	public List selectByReviewId(long review_id) {
		return reviewLikeDAO.selectByReviewId(review_id);
	}
	
	@Override
	public void insert(ReviewLike reviewLike) throws ReviewLikeException{
		reviewLikeDAO.insert(reviewLike);
	}
}
