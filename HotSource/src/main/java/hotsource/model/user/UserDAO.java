package hotsource.model.user;

import java.util.List;

import hotsource.domain.User;

public interface UserDAO {

	public List selectAll();
	public User select(long user_id);
	public User selectById(String id);
	public User selectByEmail(String email);
	public List selectByRoleId(long role_id);
	public void insert(User user);
	public void update(User user);
}
