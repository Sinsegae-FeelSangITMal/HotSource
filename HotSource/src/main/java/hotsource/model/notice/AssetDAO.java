package hotsource.model.notice;

import java.util.List;

import hotsource.domain.Asset;

public interface AssetDAO {
	public List selectAll();
	public Asset select(int asset_id);
	public List selectBySellerId(int seller_id);
}
