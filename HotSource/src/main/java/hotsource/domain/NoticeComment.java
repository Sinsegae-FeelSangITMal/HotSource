package hotsource.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
public class NoticeComment {
	private Long notice_comment_id;
    private Notice notice;
    private User User; //1:1 관계 (mybatis 에서 association 으로 매핑)
    private String content;
	private String create_date;
}