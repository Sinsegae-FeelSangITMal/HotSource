package hotsource.model.subscribe;

import java.util.List;

public interface SubscribeService {
	public List selectAll();
	public List selectByUserId(int user_id);
	public List selectBySellerId(int seller_id);
}
