package hotsource.domain;

import lombok.Data;

@Data
public class OrderedAsset {
	private int order_asset_id;
	private int seller_id;
	private String seller_name;
	private String asset_title;
	private int asset_price;
	private int asset_discount;
	private int asset_pay;
	private Ordered ordered;
	private Asset asset;
}
