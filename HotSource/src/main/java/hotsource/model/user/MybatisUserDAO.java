package hotsource.model.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.User;
import hotsource.exception.UserException;
import hotsource.exception.UserNotFoundException;

@Repository
public class MybatisUserDAO implements UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public User selectById(String id) {
		return sqlSessionTemplate.selectOne("User.selectById", id);
	}

	@Override
	public void insert(User user) throws UserException {

		int result = sqlSessionTemplate.insert("User.insert", user);
		if (result < 1) {
			throw new UserException("사용자 등록 실패");
		}
	}

	@Override
	public User selectByEmail(String email) throws UserNotFoundException {
		User user = sqlSessionTemplate.selectOne("User.selectByEmail", email);

		if (user == null) {
			throw new UserNotFoundException("일치하는 정보가 없습니다");
		}

		return user;
	}

}
