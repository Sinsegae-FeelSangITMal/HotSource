package hotsource.model.user_keyword_mapping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserKeywordMappingServiceImpl implements UserKeywordMappingService {

	@Autowired
	private UserKeywordMappingDAO userKeywordMappingDAO;
	
	@Override
	public List selectByUserId(int user_id) {
		return userKeywordMappingDAO.selectByUserId(user_id);
	}
}
