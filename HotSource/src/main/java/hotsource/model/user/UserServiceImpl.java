package hotsource.model.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;


	@Override
	public List selectAll() {
		return userDAO.selectAll();
	}

	@Override
	public User selectByUserId(int user_id) {
		return userDAO.selectByUserId(user_id);
	}

}
