package hotsource.model.review_like;

import java.util.List;

public interface ReviewLikeDAO {
	public List selectByReviewId(long review_id);
}
