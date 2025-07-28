package hotsource.model.review_like;

import java.util.List;

public interface ReviewLikeService {
	public List selectByReviewId(int review_id);
}
