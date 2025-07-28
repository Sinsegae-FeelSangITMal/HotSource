package hotsource.domain;

import lombok.Data;

@Data
public class AssetFile {
	private long asset_file_id;
	private String file_url;
	
	private Asset asset;
}
