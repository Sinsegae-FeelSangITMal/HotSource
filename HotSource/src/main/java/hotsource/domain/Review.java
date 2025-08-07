package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Review {
	private long review_id;
	private double rate;
	private String comment;
	private Timestamp create_date;
	private Timestamp update_date;
	
	private User user;
	private Asset asset;
	private OrderedAsset orderedAsset;
	
	private ReviewLike reviewLike;
}
