package hotsource.domain;

import lombok.Data;

@Data
public class ReviewLike {
	private long review_like_id;
	private boolean is_like;
	
	private User user;
	private Review review;
}
