package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class User {
	private long user_id;
	private String id;
	private String password;
	private String user_name;
	private String user_email;
	private String user_nickname;
	private String profile_img_url;
	private String salt;
	private Timestamp create_date;
	private Role role;
	private SnsProvider snsProvider;
	
	private List<Ordered> orderList;
	private List<Review> reviewList;
	private List<Wishlist> wishList;
	private List<Cart> cartList;
	
	MultipartFile photo;
}
