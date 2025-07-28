package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AssetView {
	private long asset_view_id;
	private Timestamp viewed_date;
	
	private User user;
	private Asset Asset;
}