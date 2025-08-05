package hotsource.model.review_like;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.ReviewLike;
import hotsource.exception.ReviewLikeException;

@Repository
public class MybatisReviewLikeDAO implements ReviewLikeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectByReviewId(long review_id) {
		return sqlSessionTemplate.selectList("ReviewLike.selectByReviewId", review_id);
	}
	
	@Override
	public void insert(ReviewLike reviewLike) throws ReviewLikeException{
		int result = sqlSessionTemplate.insert("ReviewLike.insert", reviewLike);
		if (result < 1)
			throw new ReviewLikeException("리뷰 추천 등록에 실패했습니다");
	}
}
