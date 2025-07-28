package hotsource.domain;

import lombok.Data;

@Data
public class UserKeywordMapping {
	private long user_keyword_mapping_id;
	private User user;
	private Keyword keyword;
}
