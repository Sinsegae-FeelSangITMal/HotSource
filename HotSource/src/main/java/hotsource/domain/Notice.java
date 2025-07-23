package hotsource.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="notice")
public class Notice {
	// 컬럼 바꿔야함

	@Id
	private int notice_id;
	private String title;
	private String content;
	private String create_date;
	private String notice_img_url;
	
	// private Seller seller;
}
