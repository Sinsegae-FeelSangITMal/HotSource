package hotsource.model.seller;

import java.util.List;

import hotsource.domain.Seller;

public interface SellerDAO {
	public List selectAll();
	public Seller select(int seller_id);
}
