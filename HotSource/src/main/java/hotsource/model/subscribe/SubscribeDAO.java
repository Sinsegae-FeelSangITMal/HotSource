package hotsource.model.subscribe;

import java.util.List;

public interface SubscribeDAO {
	
	public List selectAll();
	public List selectByUserId(long user_id);
	public List selectBySellerId(long seller_id);
	public int selectSubCount(int seller_id);
}
