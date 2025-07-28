package hotsource.model.asset;

import java.util.List;

import hotsource.domain.Asset;

public interface AssetService {
	public List selectAll();
	public Asset select(int asset_id);
	public List selectBySellerId(int seller_id);
	
	public void regist(Asset asset);
	public void update(Asset asset);
	public void delete(int asset_id);
}
