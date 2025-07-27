package hotsource.model.notice;

import java.util.List;

import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;

public interface NoticeCommentDAO {	
	public List selectAll();
	public NoticeComment select(int notice_comment_id);
	public void regist(NoticeComment noticeComment);
	public void update(NoticeComment noticeComment);
	public void delete(int notice_comment_id);
}
