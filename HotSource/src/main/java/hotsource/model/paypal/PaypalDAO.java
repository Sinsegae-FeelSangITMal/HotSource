package hotsource.model.paypal;

import java.util.List;

import hotsource.domain.Paypal;

public interface PaypalDAO {
	public List selectAll();
	public Paypal select(int paypal_id);
	public Paypal selectBySellerId(int seller_id);
}
