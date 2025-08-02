package hotsource.model.user_keyword_mapping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Keyword;
import hotsource.domain.User;
import hotsource.domain.UserKeywordMapping;
import hotsource.exception.UserKeywordMappingException;
import hotsource.model.keyword.KeywordDAO;

@Service
public class UserKeywordMappingServiceImpl implements UserKeywordMappingService {

	@Autowired
	private UserKeywordMappingDAO userKeywordMappingDAO;
	@Autowired
	private KeywordDAO keywordDAO;
	
	@Override
	public List selectByUserId(long user_id) {
		return userKeywordMappingDAO.selectByUserId(user_id);
	}
	
	@Transactional
	public void insert(User user, String keyword_name) throws UserKeywordMappingException{
		// 1. keyword 정보 셀렉
		Keyword keyword = keywordDAO.selectByName(keyword_name);
		
		// 2. userKeywordMapping 세팅
		UserKeywordMapping userKeywordMapping = new UserKeywordMapping();
		userKeywordMapping.setUser(user);
		userKeywordMapping.setKeyword(keyword);
		
		// 3. userKeywordMapping에 집어넣기
		userKeywordMappingDAO.insert(userKeywordMapping);
	}
	
	@Override
	public void delete(long user_id) {
		// 기존 userKeywordMapping 데이터 삭제하기
		userKeywordMappingDAO.delete(user_id);
	}
}
