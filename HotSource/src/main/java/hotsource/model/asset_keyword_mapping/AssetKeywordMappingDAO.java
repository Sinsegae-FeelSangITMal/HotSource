package hotsource.model.asset_keyword_mapping;

import java.util.List;

public interface AssetKeywordMappingDAO {
	public List selectByAssetId(int asset_id);
}
