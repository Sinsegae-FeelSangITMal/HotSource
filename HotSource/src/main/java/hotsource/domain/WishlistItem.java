package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WishlistItem {
	private long wishlist_item_id;
	private Timestamp create_date;
	
	private Wishlist wishlist;
	private Asset asset;
}
