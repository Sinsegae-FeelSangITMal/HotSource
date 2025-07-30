package hotsource.model.user_keyword_mapping;

import java.util.List;

public interface UserKeywordMappingService {
	public List selectByUserId(long user_id);
}
