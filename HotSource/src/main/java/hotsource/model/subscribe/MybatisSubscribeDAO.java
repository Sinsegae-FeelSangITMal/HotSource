package hotsource.model.subscribe;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisSubscribeDAO implements SubscribeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Subscribe.selectAll");
	}

	@Override
	public List selectBySellerId(long seller_id) {
		return sqlSessionTemplate.selectList("Subscribe.selectBySellerId", seller_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return sqlSessionTemplate.selectList("Subscribe.selectByUserId", user_id);
	}
}
