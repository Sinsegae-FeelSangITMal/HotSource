package hotsource.model.user_keyword_mapping;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisUserKeywordMappingDAO implements UserKeywordMappingDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectByUserId(int user_id) {
		return sqlSessionTemplate.selectList("UserKeywordMapping.selectByUserId", user_id);
	}
}
