package hotsource.model.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.NoticeLike;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MybatisNoticeLikeDAO implements NoticeLikeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		log.debug("DAO의 selectAll() 도달");
		return sqlSessionTemplate.selectList("NoticeLike.selectAll");
	}

	@Override
	public NoticeLike select(int notice_like_id) {
		return sqlSessionTemplate.selectOne("NoticeLike.select", notice_like_id);
	}

}
