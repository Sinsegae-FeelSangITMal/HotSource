
package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class Wishlist {
	private int wishlist_id;
	private User user;
	private String list_name;
	private String description;
	private Timestamp create_date;
	private List<WishlistItem> itemList;
}
