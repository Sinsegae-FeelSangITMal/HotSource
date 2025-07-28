package hotsource.model.seller;

import java.util.List;

import hotsource.domain.Seller;

public interface SellerService {
	public List selectAll();
	public Seller select(int seller_id);
	public Seller selectByUserId(int user_id);
}
