package hotsource.exception;

public class ReviewException extends RuntimeException{

	public ReviewException(String msg) {
		super(msg);
	}
	public ReviewException(String msg, Throwable e) {
		super(msg, e);
	}
	public ReviewException(Throwable e) {
		super(e);
	}
}
