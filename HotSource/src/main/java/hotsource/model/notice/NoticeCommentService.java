package hotsource.model.notice;

import java.util.List;

import hotsource.domain.NoticeComment;

public interface NoticeCommentService {

	public List selectAll();
	public NoticeComment select(int notice_comment_id);
	
	// 두 개의 이상의 DAO를 대상으로 업무할 경우 insert보다 상위 개념의 등록을 표현하는 메서드명으로 가는게 좋다.
	public void regist(NoticeComment noticeComment);
	
	public void update(NoticeComment noticeComment);
	public void delete(int notice_comment_id);
	
}
