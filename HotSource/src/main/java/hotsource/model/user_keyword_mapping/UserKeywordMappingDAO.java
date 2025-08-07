package hotsource.model.user_keyword_mapping;

import java.util.List;

import hotsource.domain.UserKeywordMapping;

public interface UserKeywordMappingDAO {
	public List selectByUserId(long user_id);
	public void insert(UserKeywordMapping userKeywordMapping);
	public void delete(long user_id);
}
