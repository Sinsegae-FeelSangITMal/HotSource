package hotsource.model.user;

import java.util.List;

import hotsource.domain.Notice;
import hotsource.domain.User;

public interface UserService {

	//public void regist(User user);
	
	public List selectAll();
	public User selectByUserId(int user_id);
}
