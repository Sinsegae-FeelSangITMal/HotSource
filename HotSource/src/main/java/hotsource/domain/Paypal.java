package hotsource.domain;

import lombok.Data;

@Data
public class Paypal {
	private long paypal_id;
	private String paypal_status;
	private String paypal_payer_id;
	private boolean paypal_verified;
	private String paypal_email;
	
	private Seller seller;
}
