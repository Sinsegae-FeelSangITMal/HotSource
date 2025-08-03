package hotsource.model.ordered;

import java.util.List;
import java.util.Map;

import hotsource.domain.Ordered;

public interface OrderedDAO {
	public List selectAll();
	public Ordered select(long order_id);
	public List selectByUserId(long user_id);
	public boolean existsByUserIdAndAssetId(Map<String, Object> paramMap);
}
