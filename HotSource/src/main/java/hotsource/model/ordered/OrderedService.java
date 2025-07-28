package hotsource.model.ordered;

import java.util.List;

import hotsource.domain.Ordered;

public interface OrderedService {
	public List selectAll();
	public Ordered select(long order_id);
	public List selectByUserId(long user_id);
}
