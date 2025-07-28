package hotsource.exception;

public class AssetException extends RuntimeException{

	public AssetException(String msg) {
		super(msg);
	}
	public AssetException(String msg, Throwable e) {
		super(msg, e);
	}
	public AssetException(Throwable e) {
		super(e);
	}
}
