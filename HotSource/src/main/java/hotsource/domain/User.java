package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class User {

	private Long user_id;
	private String id;
	private String password;
	private String user_name;
	private String user_email;
	private String user_nickname;
	private String profile_img_url;
	private Timestamp create_date;
	
	private Role role;
	private SnsProvider snsProvider;
}
