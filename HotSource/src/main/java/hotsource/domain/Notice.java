package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Notice {
	private int notice_id;
	private String title;
	private String content;
	private Timestamp create_date;
	private String notice_img_url;
	private Seller seller;
}
