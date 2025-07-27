package hotsource.model.user;

import java.util.List;

import hotsource.domain.User;

public interface UserDAO {

	//public void insert(User user);
	
	public List selectAll();
	public User selectByUserId(int user_id);
}
