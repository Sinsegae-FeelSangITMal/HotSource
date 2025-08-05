package hotsource.model.review_like;

import java.util.List;

import hotsource.domain.ReviewLike;

public interface ReviewLikeDAO {
	public List selectByReviewId(long review_id);
	public void insert(ReviewLike reviewLike);
}
