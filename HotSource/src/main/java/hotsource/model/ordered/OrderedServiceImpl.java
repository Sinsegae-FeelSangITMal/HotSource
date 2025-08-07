package hotsource.model.ordered;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Ordered;

@Service
public class OrderedServiceImpl implements OrderedService {
	
	@Autowired
	private OrderedDAO orderedDAO;
	
	@Override
	public List selectAll() {
		return orderedDAO.selectAll();
	}

	@Override
	public Ordered select(long order_id) {
		return orderedDAO.select(order_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return orderedDAO.selectByUserId(user_id);
	}

	@Override
	public boolean isPurchased(long asset_id, long user_id) {	
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_id", user_id);
	    paramMap.put("asset_id", asset_id);
		return orderedDAO.existsByUserIdAndAssetId(paramMap);
	}
	
	
}
