package hotsource.model.asset_file;

import java.util.List;

import hotsource.domain.AssetFile;

public interface AssetFileDAO {

	public void insert(List<AssetFile> assetFilesList);
	public List<AssetFile> selectByAssetId(long asset_id);
	public void deleteByAssetId(long asset_id);
}
