package hotsource.model.asset;

import java.util.List;

import hotsource.domain.Asset;

public interface AssetDAO {
	public List selectAll();
	public Asset select(long asset_id);
	public int selectCount(long seller_id);
	public List selectBySellerId(long seller_id);
	public List selectHot(long topcategory_id);
	public List selectNew(long topcategory_id);
	public List selectFree(long topcategory_id);
	public List selectSale(long topcategory_id);
	
	public void insert(Asset asset);
	public void update(Asset asset);
	public void delete(long asset_id);
}
