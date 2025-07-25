package hotsource.model.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.User;
import hotsource.exception.UserException;

@Repository
public class MybatisUserDAO implements UserDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(User user) throws UserException {
		
		int result = sqlSessionTemplate.insert("User.insert",user);
		if (result< 1) {
			throw new UserException("사용자 등록 실패");
		}
	}

}
