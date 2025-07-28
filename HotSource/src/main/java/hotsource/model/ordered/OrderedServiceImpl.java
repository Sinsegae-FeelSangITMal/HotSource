package hotsource.model.ordered;

import java.util.List;

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
	public Ordered select(int order_id) {
		return orderedDAO.select(order_id);
	}

	@Override
	public List selectByUserId(int user_id) {
		return orderedDAO.selectByUserId(user_id);
	}
}
