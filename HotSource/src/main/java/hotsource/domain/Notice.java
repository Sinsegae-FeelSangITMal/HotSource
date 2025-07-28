package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
public class Notice {
	private Long notice_id;
	private Seller seller; //1:1 관계 (mybatis 에서 association 으로 매핑)
	private String title;
	private String content;
	private Timestamp create_date;
	private String notice_img_url;

    // 하나의 공지는 여러 댓글을 보유할 수 있다  1:多 관계 (mybatis 에서 collection 수집)
    private List<NoticeComment> commentList;
    private List<NoticeLike> likeList;

}
