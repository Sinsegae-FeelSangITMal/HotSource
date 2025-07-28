package hotsource.model.user;

import java.util.List;

import hotsource.domain.User;

public interface UserDAO {
	public List selectAll();
	public User select(int user_id);
	public List selectByRoleId(int role_id);
	public void insert(User user);
}
