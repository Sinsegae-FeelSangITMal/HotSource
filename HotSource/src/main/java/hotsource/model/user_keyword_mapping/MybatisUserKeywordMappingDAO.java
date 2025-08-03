package hotsource.model.user_keyword_mapping;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.UserKeywordMapping;
import hotsource.exception.UserKeywordMappingException;

@Repository
public class MybatisUserKeywordMappingDAO implements UserKeywordMappingDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectByUserId(long user_id) {
		return sqlSessionTemplate.selectList("UserKeywordMapping.selectByUserId", user_id);
	}
	
	@Override
	public void insert(UserKeywordMapping userKeywordMapping) throws UserKeywordMappingException{
		int result = sqlSessionTemplate.insert("UserKeywordMapping.insert", userKeywordMapping);
		if (result < 1)
			throw new UserKeywordMappingException("유저 키워드 등록 실패");
	}
	
	@Override
	public void delete(long user_id) throws UserKeywordMappingException{
		int result = sqlSessionTemplate.delete("UserKeywordMapping.delete", user_id);
		if (result < 1)
			throw new UserKeywordMappingException("유저 키워드 삭제 실패");
	}
}
