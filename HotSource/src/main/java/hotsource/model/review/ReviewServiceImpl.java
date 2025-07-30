package hotsource.model.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public List selectAll() {
		return reviewDAO.selectAll();
	}

	@Override
	public Review select(long review_id) {
		return reviewDAO.select(review_id);
	}

	@Override
	public List selectByAssetId(long asset_id) {
		return reviewDAO.selectByAssetId(asset_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return reviewDAO.selectByUserId(user_id);
	}

	@Override
	public Review selectByOrderedAssetId(long order_asset_id) {
		return reviewDAO.selectByOrderedAssetId(order_asset_id);
	}

//	@Override
//	public double selectAvgRate(int seller_id) {
//		return reviewDAO.selectAvgRate(seller_id);
//	}
}
