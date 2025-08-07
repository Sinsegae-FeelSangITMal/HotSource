package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Notice {
	private long notice_id;
	private String title;
	private String content;
	private Timestamp create_date;
	private String notice_img_url;
	
	private Seller seller; //1:1 관계 (mybatis 에서 association 으로 매핑)
	
	private MultipartFile notice_profile;

    // 하나의 공지는 여러 댓글을 보유할 수 있다  1:多 관계 (mybatis 에서 collection 수집)
    private List<NoticeComment> commentList;
    private List<NoticeLike> likeList;
    
    public boolean isLikedByLoginUser(long loginUserId) {
        if (likeList == null) return false;
        return likeList.stream()
                .anyMatch(like -> like.getUser().getUser_id() == loginUserId);
    }
}
