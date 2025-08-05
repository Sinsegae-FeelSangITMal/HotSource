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
	
	@Override
	public Keyword selectByName(String keyword_name) {
		return sqlSessionTemplate.selectOne("Keyword.selectByName", keyword_name);
	}

	@Override
	public void insert(Keyword keyword) {
		int result = sqlSessionTemplate.insert("Keyword.insert", keyword);
	}
	
}
