package hotsource.model.notice_comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;
import hotsource.exception.NoticeException;
import lombok.extern.slf4j.Slf4j;

// 애플리케이션 설계 분야에서 CRUD를 수행하는 역할을 가리켜 Repository라 한다.
// @EnableWebMvc 애노테이션에 의해 @Controller, @Repository, @Service, @Component 등을 찾아 인스턴스
// 생성하여 싱글턴으로 관리
@Slf4j
@Repository
public class MybatisNoticeCommentDAO implements NoticeCommentDAO{
	
	// 스프링 컨테이너로 하여금 자동으로 주입시켜달라!
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("NoticeComment.selectAll");
	}

	@Override
	public NoticeComment select(long notice_comment_id) {
		return sqlSessionTemplate.selectOne("NoticeComment.select", notice_comment_id);
	}

	@Override
	public void regist(NoticeComment noticeComment) {
		
	}

	@Override
	public void update(NoticeComment noticeComment) {
		
	}

	@Override
	public void delete(long notice_comment_id) {
		
	}
}
