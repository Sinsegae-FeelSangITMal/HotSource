package hotsource.model.user;

import java.util.List;

import hotsource.domain.User;

public interface UserService {
	public List selectAll();
	public User select(long user_id);
	public List selectByRoleId(long role_id);
	public void regist(User user);
}
