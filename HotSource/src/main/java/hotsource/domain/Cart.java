package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Cart {
	private int cart_id;
	private Asset asset;
	private User user;
	private Timestamp create_date;
}
