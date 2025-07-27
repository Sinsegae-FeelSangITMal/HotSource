package hotsource.domain;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
public class NoticeLike {
	private Long notice_like_id;
    private Boolean is_like;
    private Notice notice;
    
    //private User user;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
