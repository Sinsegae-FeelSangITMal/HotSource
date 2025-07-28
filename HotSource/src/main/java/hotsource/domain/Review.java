package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Review {
	private int review_id;
	private float rate;
	private String comment;
	private Timestamp create_date;
	private Timestamp update_date;
	private User user;
	private Asset asset;
	private OrderedAsset orderedAsset;
}
