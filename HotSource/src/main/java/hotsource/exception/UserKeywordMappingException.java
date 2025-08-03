package hotsource.exception;

public class UserKeywordMappingException extends RuntimeException{

	public UserKeywordMappingException(String msg) {
		super(msg);
	}
	public UserKeywordMappingException(String msg, Throwable e) {
		super(msg, e);
	}
	public UserKeywordMappingException(Throwable e) {
		super(e);
	}
}
