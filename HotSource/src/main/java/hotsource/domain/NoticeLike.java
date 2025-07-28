package hotsource.domain;

import lombok.Data;

@Data
public class NoticeLike {
	private long notice_like_id;
    private boolean is_like;
    
    private Notice notice;
    private User user;
}
