package hotsource.model.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import hotsource.domain.User;
import hotsource.exception.UserException;
import hotsource.exception.UserNotFoundException;

@Primary
@Repository
public class MybatisUserDAO implements UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("User.selectAll");
	}

	@Override
	public User select(long user_id) {
		return sqlSessionTemplate.selectOne("User.select", user_id);
	}

	@Override
	public User selectById(String id) {
		return sqlSessionTemplate.selectOne("User.selectById", id);
	}

	@Override
	public List selectByRoleId(long role_id) {
		return sqlSessionTemplate.selectList("User.selectByRoleId", role_id);
	}

	@Override
	public User selectByEmail(String email) throws UserNotFoundException {
		User user = sqlSessionTemplate.selectOne("User.selectByEmail", email);

		if (user == null) {
			throw new UserNotFoundException("일치하는 정보가 없습니다");
		}

		return user;
	}

	@Override
	public void insert(User user) throws UserException {

		int result = sqlSessionTemplate.insert("User.insert", user);
		if (result < 1) 
			throw new UserException("사용자 등록 실패");
	}
	
	@Override
	public void updateBasic(User user) throws UserException {
		int result = sqlSessionTemplate.update("User.updateBasic", user);
		System.out.println("Repository User 정보: " + user);
		if(result < 1)
			throw new UserException("사용자 Basic 정보 수정 실패");
	}
	
	@Override
	public void updateKeyword(User user) throws UserException {
		int result = sqlSessionTemplate.update("User.updateKeyword", user);
		System.out.println("Repository User 정보: " + user);
		if(result < 1)
			throw new UserException("사용자 Keyword 정보 수정 실패");
	}
	
	@Override
	public void updatePassword(User user) throws UserException {
		int result = sqlSessionTemplate.update("User.updatePassword", user);
		System.out.println("Repository User 정보: " + user);
		if(result < 1)
			throw new UserException("사용자 Password 정보 수정 실패");
	}

}
