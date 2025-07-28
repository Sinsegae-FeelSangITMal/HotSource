package hotsource.model.notice;

import java.util.List;

import hotsource.domain.Ordered;

public interface OrderedDAO {
	public List selectAll();
	public Ordered select(int order_id);
	public List selectByUserId(int user_id);
}
