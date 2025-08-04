package hotsource.model.asset_keyword_mapping;

import java.util.List;

import hotsource.domain.AssetKeywordMapping;

public interface AssetKeywordMappingDAO {
	public List selectByAssetId(long asset_id);
	public void insert(AssetKeywordMapping assetKeywordMapping);
	public void deleteByAssetId(long asset_id);
}
