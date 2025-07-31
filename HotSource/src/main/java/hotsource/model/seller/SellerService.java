package hotsource.model.seller;

import java.util.List;

import hotsource.domain.Seller;

public interface SellerService {
	public List selectAll();
	public Seller selectByUserId(long user_id);
	public Seller selectBySellerId(long seller_id);
	public void regist(Seller seller, String savePath);
}
