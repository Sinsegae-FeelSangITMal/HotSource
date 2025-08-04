package hotsource.exception;

public class AssetKeywordMappingException extends RuntimeException{

	public AssetKeywordMappingException(String msg) {
		super(msg);
	}
	public AssetKeywordMappingException(String msg, Throwable e) {
		super(msg, e);
	}
	public AssetKeywordMappingException(Throwable e) {
		super(e);
	}
}
