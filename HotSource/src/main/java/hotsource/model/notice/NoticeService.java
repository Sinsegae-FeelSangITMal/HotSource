package hotsource.model.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Notice;
import hotsource.domain.NoticeComment;

public interface NoticeService {

	public List selectAll();
	public Notice select(long notice_id);
	public List selectBySellerId(long seller_id);
	// 두 개의 이상의 DAO를 대상으로 업무할 경우 insert보다 상위 개념의 등록을 표현하는 메서드명으로 가는게 좋다.
	public void regist(Notice notice, String savePath);
	public void update(Notice notice);
	public void delete(long notice_id);
	
	public NoticeComment registComment(long notice_id, long user_id, String content);
}
