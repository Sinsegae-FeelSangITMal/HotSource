package hotsource.exception;

public class NoticeLikeException extends RuntimeException{

	public NoticeLikeException(String msg) {
		super(msg);
	}
	public NoticeLikeException(String msg, Throwable e) {
		super(msg, e);
	}
	public NoticeLikeException(Throwable e) {
		super(e);
	}
}
