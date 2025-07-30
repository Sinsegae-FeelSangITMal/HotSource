package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Cart {
	private long cart_id;
	private Timestamp create_date;
	
	private Asset asset;
	private User user;
}
