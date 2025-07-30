package hotsource.model.notice_like;

import java.util.List;

import hotsource.domain.NoticeLike;


/*
 * HibernateNoticeDAO 이건, MybatisNoticeDAO, JdbcNoticeDAO 이건 상관없는 Notice를 대상으로 한 
 * DAO들의 최상위 DAO
 */
public interface NoticeLikeDAO {

	public List selectAll();
	public NoticeLike select(long notice_like_id);
}
