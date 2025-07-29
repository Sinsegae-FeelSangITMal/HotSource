package hotsource.model.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public User selectById(String id) {
		return userDAO.selectById(id);
	}
	@Override
	public void regist(User user) {
		
		userDAO.insert(user);
		
		// 이메일 발송
	}


}
