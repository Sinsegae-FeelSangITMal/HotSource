package hotsource.model.keyword;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Keyword;

@Repository
public class MybatisKeywordDAO implements KeywordDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Keyword.selectAll");
	}

	@Override
	public Keyword select(long keyword_id) {
		return sqlSessionTemplate.selectOne("Keyword.select", keyword_id);
	}
}
