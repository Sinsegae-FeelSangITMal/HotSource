package hotsource.model.wishlist;

import java.util.List;

import lombok.Data;

@Data
public class WishlistDetailDTO {
	private long wishlist_id;
	private String list_name;
	private String description;
	private List<AssetCardDTO> assetList;
}
