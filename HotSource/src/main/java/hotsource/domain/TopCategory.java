package hotsource.domain;

import java.util.List;

import lombok.Data;

@Data
public class TopCategory {
	private int topcategory_id;
	private String top_name;
	
	private List<SubCategory> subList;
}
