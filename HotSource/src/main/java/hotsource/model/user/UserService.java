package hotsource.model.user;

import java.util.List;

import hotsource.domain.User;

public interface UserService {
	
	public User selectById(String id);
	public List selectAll();
	public User select(long user_id);
	public List selectByRoleId(long role_id);
	public void regist(User user);
	public void update(User user);
	public User login(User user);
}
