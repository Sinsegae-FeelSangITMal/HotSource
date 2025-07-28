package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

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
	
    private Seller seller;
    private SubCategory subCategory;
       
	private List<Review> reviewList;
	private List<AssetKeywordMapping> keywordList;
}
