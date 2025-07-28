package hotsource.model.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Review;

@Repository
public class MybatisReviewDAO implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Review.selectAll");
	}

	@Override
	public Review select(int review_id) {
		return sqlSessionTemplate.selectOne("Review.select", review_id);
	}

	@Override
	public List selectByAssetId(int asset_id) {
		return sqlSessionTemplate.selectList("Review.selectByAssetId", asset_id);
	}

	@Override
	public List selectByUserId(int user_id) {
		return sqlSessionTemplate.selectList("Review.selectByUserId", user_id);
	}

	@Override
	public Review selectByOrderedAssetId(int order_asset_id) {
		return sqlSessionTemplate.selectOne("Review.selectByOrderedAssetId", order_asset_id);
	}
}
