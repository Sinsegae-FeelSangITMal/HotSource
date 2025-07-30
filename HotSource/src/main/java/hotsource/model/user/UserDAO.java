package hotsource.model.user;

import hotsource.domain.User;

public interface UserDAO {
	
	public User selectById(String id);
	
	public User selectByEmail(String email);

	public void insert(User user);
}
