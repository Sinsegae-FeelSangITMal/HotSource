package hotsource.model.seller;

import java.util.List;

import hotsource.domain.Seller;

public interface SellerDAO {
	public List selectAll();
	public Seller select(long seller_id);
	public Seller selectByUserId(long user_id);
}
