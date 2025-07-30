package hotsource.model.asset;

import java.util.List;

import hotsource.domain.Asset;

public interface AssetDAO {
	public List selectAll();
	public Asset select(long asset_id);
	public int selectCount(long seller_id);
	public List selectBySellerId(long seller_id);
	
	public void regist(Asset asset);
	public void update(Asset asset);
	public void delete(long asset_id);
}
