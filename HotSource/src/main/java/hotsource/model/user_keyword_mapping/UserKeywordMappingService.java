package hotsource.model.user_keyword_mapping;

import java.util.List;

import hotsource.domain.User;

public interface UserKeywordMappingService {
	public List selectByUserId(long user_id);
	public void insert(User user, String keyword_name);
	public void delete(long user_id);
}
