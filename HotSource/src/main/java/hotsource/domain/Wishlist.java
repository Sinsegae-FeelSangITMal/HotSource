
package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Wishlist {
	private long wishlist_id;
	private String list_name;
	private String description;
	private Timestamp create_date;
	
	private User user;
}
