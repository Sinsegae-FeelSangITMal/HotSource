package hotsource.model.notice;

import java.util.List;

import hotsource.domain.Notice;
import hotsource.domain.NoticeLike;

public interface NoticeLikeService {

	public List selectAll();
	public NoticeLike select(int notice_like_id);
	
}
