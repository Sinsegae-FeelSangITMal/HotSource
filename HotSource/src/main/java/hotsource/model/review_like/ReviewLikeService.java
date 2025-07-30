package hotsource.model.review_like;

import java.util.List;

public interface ReviewLikeService {
	public List selectByReviewId(long review_id);
}
