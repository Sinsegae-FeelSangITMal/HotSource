package hotsource.model.asset_keyword_mapping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AssetKeywordMappingServiceImpl implements AssetKeywordMappingService {

	@Autowired
	private AssetKeywordMappingDAO assetKeywordMappingDAO;
	
	@Override
	public List selectByAssetId(long asset_id) {
		return assetKeywordMappingDAO.selectByAssetId(asset_id);
	}
}
