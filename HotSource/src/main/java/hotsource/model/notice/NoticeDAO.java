package hotsource.model.notice;

import java.util.List;

import hotsource.domain.Notice;


/*
 * HibernateNoticeDAO 이건, MybatisNoticeDAO, JdbcNoticeDAO 이건 상관없는 Notice를 대상으로 한 
 * DAO들의 최상위 DAO
 */
public interface NoticeDAO {

	public List selectAll();
	public Notice select(long notice_id);
	public List selectBySellerId(long seller_id);
	public void insert(Notice notice);
	public void update(Notice notice);
	public void delete(long notice_id);
	
	
}
