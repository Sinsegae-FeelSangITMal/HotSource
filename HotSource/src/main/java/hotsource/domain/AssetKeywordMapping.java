package hotsource.domain;

import lombok.Data;

@Data
public class AssetKeywordMapping {
	private long asset_keyword_mapping_id;
	
	private Asset asset;
	private Keyword keyword;
}
