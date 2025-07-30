package hotsource.model.keyword;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Keyword;

@Service
public class KeywordServiceImpl implements KeywordService {

	@Autowired
	private KeywordDAO keywordDAO;
	
	@Override
	public List selectAll() {
		return keywordDAO.selectAll();
	}

	@Override
	public Keyword select(long keyword_id) {
		return keywordDAO.select(keyword_id);
	}
}
