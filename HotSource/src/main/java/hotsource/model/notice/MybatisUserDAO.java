package hotsource.model.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.User;

@Repository
public class MybatisUserDAO implements UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("User.selectAll");
	}

	@Override
	public User select(int user_id) {
		return sqlSessionTemplate.selectOne("User.select", user_id);
	}

	@Override
	public List selectByRoleId(int role_id) {
		return sqlSessionTemplate.selectList("User.selectByRoleId", role_id);
	}
}
