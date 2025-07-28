package hotsource.model.subscribe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDAO subscribeDAO;
	
	@Override
	public List selectAll() {
		return subscribeDAO.selectAll();
	}

	@Override
	public List selectBySellerId(long seller_id) {
		return subscribeDAO.selectBySellerId(seller_id);
	}

	@Override
	public List selectByUserId(long user_id) {
		return subscribeDAO.selectByUserId(user_id);
	}
}
