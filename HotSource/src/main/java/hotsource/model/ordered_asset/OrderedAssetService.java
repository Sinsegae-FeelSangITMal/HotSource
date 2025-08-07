package hotsource.model.ordered_asset;

import java.util.List;

import hotsource.domain.OrderedAsset;

public interface OrderedAssetService {
	public List selectAll();
	public OrderedAsset select(long order_asset_id);
	public List selectByOrderId(long order_id);
}
