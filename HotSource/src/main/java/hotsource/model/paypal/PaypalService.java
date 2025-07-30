package hotsource.model.paypal;

import java.util.List;

import hotsource.domain.Paypal;

public interface PaypalService {
	public List selectAll();
	public Paypal select(long paypal_id);
	public Paypal selectBySellerId(long seller_id);
}
