package hotsource.model.review;

import java.util.List;

import hotsource.domain.Review;

public interface ReviewDAO {
	public List selectAll();
	public Review select(long review_id);
	public List selectByUserId(long user_id);
	public List selectByAssetId(long asset_id);
	public Review selectByOrderedAssetId(long order_asset_id);
//	public double selectAvgRate(int seller_id);
	public double selectAverageRateByAssetId(long asset_id);
	public int countByAssetId(long asset_id);
}
