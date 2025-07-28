package hotsource.model.review;

import java.util.List;

import hotsource.domain.Review;

public interface ReviewDAO {
	public List selectAll();
	public Review select(int review_id);
	public List selectByUserId(int user_id);
	public List selectByAssetId(int asset_id);
	public Review selectByOrderedAssetId(int order_asset_id);
}
