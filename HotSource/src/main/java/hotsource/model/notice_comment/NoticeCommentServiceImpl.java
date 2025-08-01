package hotsource.model.notice_comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;
import hotsource.exception.NoticeException;

@Slf4j
@Service
@Transactional
public class NoticeCommentServiceImpl implements NoticeCommentService{
	
	@Autowired
	private NoticeCommentDAO noticeCommentDAO;

	@Override
	public List selectAll() {
		return noticeCommentDAO.selectAll();
	}

	@Override
	public NoticeComment select(long notice_comment_id) {
		return noticeCommentDAO.select(notice_comment_id);
	}

	@Override
	public List selectByNoticeId(long notice_comment_id) {
		return noticeCommentDAO.selectByNoticeId(notice_comment_id);
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
