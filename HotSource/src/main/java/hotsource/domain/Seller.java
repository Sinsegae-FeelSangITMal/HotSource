package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class Seller {
	private int seller_id;
	private String seller_name;
	private String seller_nickname;
	private String seller_bio;
	private String seller_insta_url;
	private String seller_email;
	private String bank_name;
	private String account_number;
	private Timestamp create_date;
	private int is_active;
	private User user;
	
	private List<Asset> assetList;
	private List<OrderedAsset> orderAssetList;
}
