package hotsource.model.review_like;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisReviewLikeDAO implements ReviewLikeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectByReviewId(int review_id) {
		return sqlSessionTemplate.selectList("ReviewLike.selectByReviewId", review_id);
	}
}
