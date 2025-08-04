package hotsource.exception;

public class AssetFileInsertException extends RuntimeException{

	public AssetFileInsertException(String msg) {
		super(msg);
	}
	public AssetFileInsertException(String msg, Throwable e) {
		super(msg, e);
	}
	public AssetFileInsertException(Throwable e) {
		super(e);
	}
}
