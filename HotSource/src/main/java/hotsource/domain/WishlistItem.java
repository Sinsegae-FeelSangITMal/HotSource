package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WishlistItem {
	private int wishlist_item_id;
	private Wishlist wishlist;
	private Asset asset;
	private Timestamp create_date;
}
