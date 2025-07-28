package hotsource.model.user_keyword_mapping;

import java.util.List;

public interface UserKeywordMappingDAO {
	public List selectByUserId(long user_id);
}
