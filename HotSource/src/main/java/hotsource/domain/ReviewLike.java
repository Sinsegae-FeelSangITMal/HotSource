package hotsource.domain;

import lombok.Data;

@Data
public class ReviewLike {
	private long review_like_id;
	private int is_like;
	
	private User user;
	private Review review;
}
