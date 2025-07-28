package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class Ordered {
	private long order_id;
	private String order_no;
	private Timestamp order_date;
	private String order_state;
	private int total_price;
	private int total_pay;
	private User user;
	private List<OrderedAsset> orderAssetList;
}
