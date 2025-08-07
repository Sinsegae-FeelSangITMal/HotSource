package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Subscribe {
	private long subscribe_id;
	private Timestamp subscribe_date;
	private Timestamp cancel_date;
	
	private User user;
	private Seller seller;
}
