package hotsource.domain;

import lombok.Data;

@Data
public class AssetListItem {
	private long asset_list_item_id;
	private int list_order;
	
	private Asset asset;
	private AssetList assetList;
}
