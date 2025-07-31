package hotsource.exception;

public class AssetImgException extends RuntimeException{

	public AssetImgException(String msg) {
		super(msg);
	}
	public AssetImgException(String msg, Throwable e) {
		super(msg, e);
	}
	public AssetImgException(Throwable e) {
		super(e);
	}
}
