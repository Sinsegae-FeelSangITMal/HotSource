package hotsource.model.user;

import java.util.List;

import hotsource.domain.User;

public interface UserService {
	public List selectAll();
	public User select(int user_id);
	public List selectByRoleId(int role_id);
	public void regist(User user);
}
