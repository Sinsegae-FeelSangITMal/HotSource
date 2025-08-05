package hotsource.model.notice;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;
import hotsource.domain.User;
import hotsource.exception.NoticeException;
import hotsource.model.notice_comment.NoticeCommentDAO;
import hotsource.model.user.UserDAO;
import hotsource.util.FileManager;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private NoticeCommentDAO noticeCommentDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private FileManager fileManager;

	public List selectAll() {
		log.debug("service의 selectAll() 도달");
		return noticeDAO.selectAll(); // DAO의 메서드 호출
	}

	public Notice select(long notice_id) {
		return noticeDAO.select(notice_id);
	}

	@Override
	public List selectBySellerId(long seller_id) {
		return noticeDAO.selectBySellerId(seller_id);
	}
	
	@Transactional
	public void regist(Notice notice, String savePath) throws NoticeException{
		fileManager.noticeImgSave(notice, savePath);
		
		noticeDAO.insert(notice);
	}

	public void update(Notice notice) {
		
	}

	public void delete(long notice_id) {
		
	}

//	@Override
//	public NoticeComment registComment(long notice_id, long user_id, String content) {
//	    NoticeComment comment = new NoticeComment();
//
//	    Notice notice = new Notice();  
//	    notice.setNotice_id(notice_id);
//	    comment.setNotice(notice);
//
//	    User user = new User(); 
//	    user.setUser_id(user_id);
//	    comment.setUser(user);
//
//	    comment.setContent(content);
//	    comment.setCreate_date(new Timestamp(System.currentTimeMillis()));
//
//	    noticeCommentDAO.regist(comment);
//
//	    return comment;
//	}
	
	public NoticeComment registComment(long notice_id, long user_id, String content) {
		NoticeComment comment = new NoticeComment();

	    Notice notice = new Notice();  
	    notice.setNotice_id(notice_id);
	    comment.setNotice(notice);
	    

	    // 추가로 유저 정보 조회해서 설정
	    User user = userDAO.select(user_id); // 또는 userService.select(user_id);
	    comment.setUser(user);

	    comment.setContent(content);
	    comment.setCreate_date(new Timestamp(System.currentTimeMillis()));
	    
	    noticeCommentDAO.regist(comment);
	    return comment;
	}


}
