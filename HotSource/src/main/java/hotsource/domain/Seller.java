package hotsource.domain;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
public class Seller {
	private int seller_id;
	private String seller_name;
	private String seller_nickname;
	private String seller_bio;
	private String profile_img_url;
	private String seller_insta_url;
	private String seller_email;
	private String bank_name;
	private String account_number;
	private String create_date;
	private Boolean is_active;
	
	private User user;
}