package hotsource.model.ordered_asset;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.OrderedAsset;

@Service
public class OrderedAssetServiceImpl implements OrderedAssetService {
	
	@Autowired
	private OrderedAssetDAO orderedAssetDAO;
	
	@Override
	public List selectAll() {
		return orderedAssetDAO.selectAll();
	}

	@Override
	public OrderedAsset select(int order_asset_id) {
		return orderedAssetDAO.select(order_asset_id);
	}

	@Override
	public List selectByOrderId(int order_id) {
		return orderedAssetDAO.selectByOrderId(order_id);
	}
}
