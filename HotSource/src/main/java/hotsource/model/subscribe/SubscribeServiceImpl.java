package hotsource.model.subscribe;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int selectSubCount(long seller_id) {
		return subscribeDAO.selectSubCount(seller_id);
	}

	@Override
    public void subscribe(long user_id, long seller_id) {
        subscribeDAO.subscribe(user_id, seller_id);
    }

    @Override
    public void unsubscribe(long user_id, long seller_id) {
        subscribeDAO.unsubscribe(user_id, seller_id);
    }

    @Override
    public boolean isSubscribed(long user_id, long seller_id) {
        return subscribeDAO.isSubscribed(user_id, seller_id);
    }
}
