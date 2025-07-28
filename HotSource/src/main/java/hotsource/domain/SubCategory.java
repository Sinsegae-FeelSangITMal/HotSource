package hotsource.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
public class SubCategory {

	private Long subcategory_id;
	private String sub_name;

	private TopCategory topcategory;

}
