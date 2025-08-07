package hotsource.model.notice_like;

import java.util.List;

import hotsource.domain.NoticeComment;
import hotsource.domain.NoticeLike;

/*
 * HibernateNoticeDAO 이건, MybatisNoticeDAO, JdbcNoticeDAO 이건 상관없는 Notice를 대상으로 한 
 * DAO들의 최상위 DAO
 */
public interface NoticeLikeDAO {

	public List selectAll();
	public NoticeLike select(long notice_like_id);
	public List selectByNoticeId(long notice_id);
	public NoticeLike selectByUserAndNotice(long user_id, long notice_id);
	boolean isLiked(long user_id, long notice_id);
	public void insert(long user_id, long notice_id);
	public void update(long user_id, long notice_id);
	public void delete(long user_id, long notice_id);
	
}
