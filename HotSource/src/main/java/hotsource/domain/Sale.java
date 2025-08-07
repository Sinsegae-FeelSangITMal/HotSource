package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Sale {
	private long sale_id;
	private long asset_id;
	private int sale_value;
	private Timestamp start_date;
	private Timestamp end_date;
	private Timestamp create_date;
}
