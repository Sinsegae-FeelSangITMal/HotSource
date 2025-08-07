package hotsource.model.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Review;
import hotsource.exception.ReviewException;

@Repository
public class MybatisReviewDAO implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Review.selectAll");
	}

	@Override
	public Review select(long review_id) {
		return sqlSessionTemplate.selectOne("Review.select", review_id);
	}

	@Override
	public List selectByAssetId(long asset_id) {
		return sqlSessionTemplate.selectList("Review.selectByAssetId", asset_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return sqlSessionTemplate.selectList("Review.selectByUserId", user_id);
	}

	@Override
	public Review selectByOrderedAssetId(long order_asset_id) {
		return sqlSessionTemplate.selectOne("Review.selectByOrderedAssetId", order_asset_id);
	}

	@Override
	public double selectAverageRateByAssetId(long asset_id) {
		return sqlSessionTemplate.selectOne("Review.selectAverageRateByAssetId", asset_id);
	}

	@Override
	public int countByAssetId(long asset_id) {
		return sqlSessionTemplate.selectOne("Review.countByAssetId", asset_id);
	}

//	@Override
//	public double selectAvgRate(int seller_id) {
//		return sqlSessionTemplate.selectOne("Review.selectAvgRate", seller_id);
//	}
	
	@Override
	public void insert(Review review) throws ReviewException{
		int result = sqlSessionTemplate.insert("Review.insert", review);
		if (result < 1)
			throw new ReviewException("리뷰 등록에 실패했습니다");
	}
}
