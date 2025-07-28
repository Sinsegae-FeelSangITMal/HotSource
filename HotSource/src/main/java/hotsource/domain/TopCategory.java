package hotsource.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
public class TopCategory {
	private Long topcategory_id;
	private String top_name;
}
