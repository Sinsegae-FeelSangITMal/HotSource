package hotsource.model.keyword;

import java.util.List;

import hotsource.domain.Keyword;

public interface KeywordDAO {
	public List selectAll();
	public Keyword select(long keyword_id);
}
