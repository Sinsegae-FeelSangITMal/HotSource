package hotsource.exception;

public class WishlistItemException extends RuntimeException{

	public WishlistItemException(String msg) {
		super(msg);
	}
	public WishlistItemException(String msg, Throwable e) {
		super(msg, e);
	}
	public WishlistItemException(Throwable e) {
		super(e);
	}
}
