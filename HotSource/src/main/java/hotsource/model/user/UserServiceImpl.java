package hotsource.model.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.User;
import hotsource.exception.UploadException;
import hotsource.exception.UserException;
import hotsource.exception.UserNotFoundException;
import hotsource.util.FileManager;
import hotsource.util.PasswordUtil;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PasswordUtil passwordUtil;
	
	@Autowired
	private FileManager fileManager;
	
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
		log.debug("User service Impl의 User 정보: " + user);
		User obj = userDAO.selectByEmail(user.getUser_email());
		
		log.debug("login obj :" + obj);
		
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

	@Transactional
	public void updateBasic(User user, String savePath) throws UserException, UploadException {
		// User 정보 저장
		User u = userDAO.select(user.getUser_id());
		u.setUser_nickname(user.getUser_nickname());
		u.setPhoto(user.getPhoto());
		
		// 이미지 저장 + User에 파일 경로 저장
		if (user.getPhoto() != null && !user.getPhoto().isEmpty()) {
			fileManager.save(user, savePath);
		    u.setProfile_img_url(user.getProfile_img_url());
		}
		
		// DB 호출
		userDAO.updateBasic(u);
	}
	
	@Override
	public boolean checkPassword(User user, String oldPwd) {
		String reqResult = passwordUtil.hashPassword(oldPwd, user.getSalt());
		
		// 기존 비밀번호가 정확히 입력됐으면 true
		if (reqResult.equals(user.getPassword()))
			return true;
		else
			return false;
	}

	@Override
	public boolean confirmPassword(User user, String newPwd) {
		String reqResult = passwordUtil.hashPassword(newPwd, user.getSalt());

		// 기존 비밀번호와 새 비밀번호가 일치하면 false (달라야 하기 때문에)
		if (reqResult.equals(user.getPassword()))
			return false;
		else
			return true;
	}
	
	@Override
	public void updatePassword(User user, String pwd) throws UserException {
		// 비밀번호 암호화
		if (user.getSnsProvider() == null) {
			String salt = passwordUtil.generateSalt();
			String hashedPassword = passwordUtil.hashPassword(pwd, salt);
			
			user.setSalt(salt);
			user.setPassword(hashedPassword);
		}
		
		// DB 수정 요청
		userDAO.updatePassword(user);
	}
	
}
