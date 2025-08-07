package hotsource.model.ordered;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Ordered;

@Repository
public class MybatisOrderedDAO implements OrderedDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Ordered.selectAll");
	}

	@Override
	public Ordered select(long order_id) {
		return sqlSessionTemplate.selectOne("Ordered.select", order_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return sqlSessionTemplate.selectList("Ordered.selectByUserId", user_id);
	}

	@Override
	public boolean existsByUserIdAndAssetId(Map<String, Object> paramMap) {
		return sqlSessionTemplate.selectOne("Ordered.existsByUserIdAndAssetId", paramMap);
	}
}
