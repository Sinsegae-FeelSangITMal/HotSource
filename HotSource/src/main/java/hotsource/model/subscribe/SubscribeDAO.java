package hotsource.model.subscribe;

import java.util.List;

public interface SubscribeDAO {
	
	public List selectAll();
	public List selectByUserId(long user_id);
	public List selectBySellerId(long seller_id);
	
	void subscribe(long user_id, long seller_id);
	void unsubscribe(long user_id, long seller_id);
	boolean isSubscribed(long user_id, long seller_id);
	
	public int selectSubCount(long seller_id);
}
