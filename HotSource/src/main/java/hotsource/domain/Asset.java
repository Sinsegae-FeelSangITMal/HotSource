package hotsource.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Asset {
	private Long asset_id;
	private String title;
	private int price;
	private String summary;
	private String description;
	private String youtube_url;
	private LocalDateTime create_date;
	private int view_count;	
	
    private Seller seller;
    private SubCategory subCategory;
}
