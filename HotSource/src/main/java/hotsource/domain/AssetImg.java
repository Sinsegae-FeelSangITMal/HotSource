package hotsource.domain;

import lombok.Data;

@Data
public class AssetImg {
	private long asset_img_id;
	private String asset_img_url;
	private Boolean is_thumb;
	
	private Asset asset;
}
