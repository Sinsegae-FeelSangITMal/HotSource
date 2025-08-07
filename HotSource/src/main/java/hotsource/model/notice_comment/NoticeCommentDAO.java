package hotsource.model.notice_comment;

import java.util.List;

import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;

public interface NoticeCommentDAO {	
	public List selectAll();
	public NoticeComment select(long notice_comment_id);
	public List selectByNoticeId(long notice_id);
	public void regist(NoticeComment noticeComment);
	public void update(NoticeComment noticeComment);
	public void delete(long notice_comment_id);
}
