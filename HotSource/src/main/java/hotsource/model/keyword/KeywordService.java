package hotsource.model.keyword;

import java.util.List;

import hotsource.domain.Keyword;

public interface KeywordService {
	public List selectAll();
	public Keyword select(int keyword_id);
}
