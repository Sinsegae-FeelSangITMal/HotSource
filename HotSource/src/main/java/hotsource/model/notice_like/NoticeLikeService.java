package hotsource.model.notice_like;

import java.util.List;

import hotsource.domain.Notice;
import hotsource.domain.NoticeLike;

public interface NoticeLikeService {

	public List selectAll();
	public NoticeLike select(long notice_like_id);
	public List selectByNoticeId(long notice_id);
	NoticeLike selectByUserAndNotice(long user_id, long notice_id);
	boolean isLiked(long user_id, long notice_id);
	public void insert(long user_id, long notice_id);
	public void update(long user_id, long notice_id);
	public void delete(long user_id, long notice_id);
	
}
