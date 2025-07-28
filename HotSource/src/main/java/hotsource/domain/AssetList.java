package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AssetList {
	private Long asset_list_id;
	private String title;
	private String description;
	private Boolean is_public;
	private Timestamp create_date;
	
	private Seller seller;
}
