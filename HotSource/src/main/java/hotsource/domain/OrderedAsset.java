package hotsource.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrderedAsset {
	private long order_asset_id;
	private long seller_id;	
	private String seller_name;
	private String asset_title;
	private int asset_price;
	private int asset_discount;
	private int asset_pay;
	
	private Ordered ordered;				// FK
	private Asset asset;					// FK
	
	private Review review;
	
	
	private List<Review> reviewList;
}
