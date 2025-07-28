package hotsource.domain;

import java.util.List;

import lombok.Data;

@Data
public class Role {
	private long role_id;
	private String role_name;
	
	private List<User> userList;
}
