package hotsource.exception;

public class TopCatgegoryException extends RuntimeException{

	public TopCatgegoryException(String msg) {
		super(msg);
	}
	public TopCatgegoryException(String msg, Throwable e) {
		super(msg, e);
	}
	public TopCatgegoryException(Throwable e) {
		super(e);
	}
}
