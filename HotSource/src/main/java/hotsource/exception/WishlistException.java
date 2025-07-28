package hotsource.exception;

public class WishlistException extends RuntimeException{

	public WishlistException(String msg) {
		super(msg);
	}
	public WishlistException(String msg, Throwable e) {
		super(msg, e);
	}
	public WishlistException(Throwable e) {
		super(e);
	}
}
