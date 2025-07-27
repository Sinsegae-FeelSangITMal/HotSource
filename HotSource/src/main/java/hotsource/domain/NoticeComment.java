package hotsource.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="notice_comment")
public class NoticeComment {

	@Id
	private Long notice_comment_id;
    private Notice notice;
    private User User; //1:1 관계 (mybatis 에서 association 으로 매핑)
    private String content;
    @Column(name = "create_date", insertable = false, updatable = false)
	private String create_date;
}