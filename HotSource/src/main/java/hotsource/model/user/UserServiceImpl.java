package hotsource.model.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.User;
import hotsource.exception.UserException;
import hotsource.exception.UserNotFoundException;
import hotsource.util.PasswordUtil;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PasswordUtil passwordUtil;
	
	@Override
	public void regist(User user) {
		
		if(user.getSnsProvider() == null) {
			String salt = passwordUtil.generateSalt();
			
			String hashedPassword = passwordUtil.hashPassword(user.getPassword(), salt);
			
			user.setSalt(salt);
			user.setPassword(hashedPassword);
		} else {
			// OAuth 로그인 → 가짜 비밀번호 및 salt 생성
			String salt = passwordUtil.generateSalt();
			user.setSalt("Oauth");
			user.setPassword("Oauth");
		}
		
		userDAO.insert(user);
	}
	
	@Override
	public User login(User user) throws UserNotFoundException{
		
		log.debug("User_email :"+user.getUser_email());
		
		User obj = userDAO.selectByEmail(user.getUser_email());
		
		log.debug("lslfsldlfslogin obj :" + obj);
		
		String dbHash = passwordUtil.hashPassword(user.getPassword(), obj.getSalt());
		
		if(dbHash.equals(obj.getPassword()) == false) {
			throw new UserNotFoundException("로그인 정보가 올바르지 않습니다");
		}
		return obj;
	}

	@Override
	public List selectAll() {
		return userDAO.selectAll();
	}

	@Override
	public User select(long user_id) {
		return userDAO.select(user_id);
	}

	@Override
	public User selectById(String id) {
		return userDAO.selectById(id);
	}
	
	@Override
	public List selectByRoleId(long role_id) {
		return userDAO.selectByRoleId(role_id);
	}
	
	
	@Override
	public void update(User user) throws UserException {
		userDAO.update(user);
	}
}
