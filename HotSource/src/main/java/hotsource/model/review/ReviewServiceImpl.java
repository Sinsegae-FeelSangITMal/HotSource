package hotsource.model.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Review;
import hotsource.domain.ReviewLike;
import hotsource.exception.ReviewException;
import hotsource.exception.ReviewLikeException;
import hotsource.model.review_like.ReviewLikeDAO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private ReviewLikeDAO reviewLikeDAO;
	
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

	@Override
	public double getAverageRateByAssetId(long asset_id) {
		double avg = reviewDAO.selectAverageRateByAssetId(asset_id); 
		
		//0.5단위로 반올림
		return Math.round(avg * 2) / 2.0;
	}

	@Override
	public int countByAssetId(long asset_id) {
		return reviewDAO.countByAssetId(asset_id);
	}
	
	@Transactional
	public void insert(Review review) throws ReviewException, ReviewLikeException{
		reviewDAO.insert(review);
	}

//	@Override
//	public double selectAvgRate(int seller_id) {
//		return reviewDAO.selectAvgRate(seller_id);
//	}
}
