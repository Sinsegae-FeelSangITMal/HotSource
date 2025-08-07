package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeComment {
	private long notice_comment_id;
    private String content;
	private Timestamp create_date;
	
    private Notice notice;
    private User User; //1:1 관계 (mybatis 에서 association 으로 매핑)
}