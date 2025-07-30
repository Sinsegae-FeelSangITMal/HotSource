package hotsource.model.notice_like;

import java.util.List;

import hotsource.domain.Notice;
import hotsource.domain.NoticeLike;

public interface NoticeLikeService {

	public List selectAll();
	public NoticeLike select(long notice_like_id);
	
}
