package hotsource.domain;

import java.sql.Timestamp;

import lombok.Data;


/*			보류			*/


@Data
public class Report {
	private long report_id;
	private String target_type;
	private int target_id;
	private String reason;
	private Timestamp create_date;
	private User user;
}
