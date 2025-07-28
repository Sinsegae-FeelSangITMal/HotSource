package hotsource.model.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;

	public void regist(User user) {
		userDAO.insert(user);
		// 이메일 ㅅ발
	}

	@Override
	public List selectAll() {
		return userDAO.selectAll();
	}

	@Override
	public User select(int user_id) {
		return userDAO.select(user_id);
	}

	@Override
	public List selectByRoleId(int role_id) {
		return userDAO.selectByRoleId(role_id);
	}
}
