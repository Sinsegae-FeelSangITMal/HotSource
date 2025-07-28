package hotsource.model.paypal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Paypal;

@Service
public class PaypalServiceImpl implements PaypalService {
	
	@Autowired
	private PaypalDAO paypalDAO;
	
	@Override
	public List selectAll() {
		return paypalDAO.selectAll();
	}

	@Override
	public Paypal select(int paypal_id) {
		return paypalDAO.select(paypal_id);
	}

	@Override
	public Paypal selectBySellerId(int seller_id) {
		return paypalDAO.selectBySellerId(seller_id);
	}
}
