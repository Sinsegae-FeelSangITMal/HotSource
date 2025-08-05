package hotsource.exception;

public class ReviewLikeException extends RuntimeException{

	public ReviewLikeException(String msg) {
		super(msg);
	}
	public ReviewLikeException(String msg, Throwable e) {
		super(msg, e);
	}
	public ReviewLikeException(Throwable e) {
		super(e);
	}
}
