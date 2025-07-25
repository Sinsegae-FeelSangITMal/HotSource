package hotsource.model.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.SnsProvider;

@Repository
public class MybatisSnsProviderDAO implements SnsProviderDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public SnsProvider selectByName(String name) {
		return sqlSessionTemplate.selectOne("SnsProvider.selectByName", name);
	}

}
