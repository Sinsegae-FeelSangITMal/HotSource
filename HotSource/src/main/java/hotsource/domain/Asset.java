package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Asset {
	private long asset_id;
	private String title;
	private int price;
	private String summary;
	private String description;
	private String youtube_url;
	private Timestamp create_date;
	private int view_count;	
	
	private Sale sale; // 유효한 세일, null인 경우 적용 가능한 sale이 없는 것임
    private Seller seller;
    private SubCategory subCategory;
    
	private List<Review> reviewList;
	private List<AssetKeywordMapping> keywordList;
	private List<AssetFile> fileList;
	private List<AssetImg> imgList;
}
