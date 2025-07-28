package hotsource.model.review_like;

import java.util.List;

public interface ReviewLikeDAO {
	public List selectByReviewId(int review_id);
}
