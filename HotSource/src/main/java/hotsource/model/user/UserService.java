package hotsource.model.user;

import hotsource.domain.User;

public interface UserService {

	public User selectById(String id);
	
	public void regist(User user);
	
	public User login(User user);
}
