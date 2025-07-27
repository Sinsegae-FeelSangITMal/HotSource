package hotsource.exception;

public class SellerException extends RuntimeException{

	public SellerException(String msg) {
		super(msg);
	}
	public SellerException(String msg, Throwable e) {
		super(msg, e);
	}
	public SellerException(Throwable e) {
		super(e);
	}
}
