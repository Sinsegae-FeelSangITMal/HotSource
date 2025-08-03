package hotsource.model.user;

import java.util.List;

import hotsource.domain.User;

public interface UserService {
	
	public User selectById(String id);
	public List selectAll();
	public User select(long user_id);
	public List selectByRoleId(long role_id);
	public void regist(User user);
	public void updateBasic(User user, String savePath);
	public boolean checkPassword(User user, String oldPwd);
	public boolean confirmPassword(User user, String newPwd);
	public void updatePassword(User user, String pwd);
	public User login(User user);
}
