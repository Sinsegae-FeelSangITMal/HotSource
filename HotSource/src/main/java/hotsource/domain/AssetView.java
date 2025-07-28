package hotsource.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class AssetView {
	private Long asset_view_id;
	private Timestamp viewed_date;
	
	private User user;
	private Asset Asset;
}