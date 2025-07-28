package hotsource.model.asset;

import java.util.List;

import hotsource.domain.Asset;

public interface AssetDAO {
	public List selectAll();
	public Asset select(int asset_id);
	
	public void regist(Asset asset);
	public void update(Asset asset);
	public void delete(int asset_id);
}
