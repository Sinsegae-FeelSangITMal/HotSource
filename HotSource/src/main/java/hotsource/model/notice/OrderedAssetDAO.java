package hotsource.model.notice;

import java.util.List;

import hotsource.domain.OrderedAsset;

public interface OrderedAssetDAO {
	public List selectAll();
	public OrderedAsset select(int order_asset_id);
	public List selectByOrderId(int order_id);
}
