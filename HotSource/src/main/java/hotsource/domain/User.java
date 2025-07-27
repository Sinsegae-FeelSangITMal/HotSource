package hotsource.domain;

import lombok.Data;

@Data
public class User {

	private int user_id;
	private String id;
	private String password;
	private String user_name;
	private String user_email;
	private String user_nickname;
	private String profile_img_url;
	private String create_date;
	
	private Role role;
	private SnsProvider snsProvider;	
}
