package hotsource.domain;

import java.sql.Timestamp;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Seller {
	private long seller_id;
	private String seller_name;
	private String seller_nickname;
	private String seller_bio;
	private String profile_img_url;
	private String seller_insta_url;
	private String seller_email;
	private String bank_name;
	private String account_number;
	private Timestamp create_date;
	private boolean is_active;
	
	private User user;
	private MultipartFile seller_profile;
	
	private List<Asset> assetList;
	private List<Review> reviewList;
	private List<OrderedAsset> orderAssetList;
	private List<Subscribe> subscribeList;
	private List<Notice> noticeList;
	private List<NoticeComment> noticeCommentList;
	private List<NoticeLike> noticeLikeList; 
}
