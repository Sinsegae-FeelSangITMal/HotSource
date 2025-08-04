package hotsource.domain;

import java.util.List;

import lombok.Data;

@Data
public class SubCategory {
	private int subcategory_id;
	private String sub_name;

	private TopCategory topcategory;

	private List<Asset> assetList;
}
