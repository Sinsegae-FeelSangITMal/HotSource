package hotsource.domain;

import java.util.List;

import lombok.Data;

@Data
public class AssetFile {
	private Long asset_file_id;
	private String file_url;
	
	private Asset asset;
}
