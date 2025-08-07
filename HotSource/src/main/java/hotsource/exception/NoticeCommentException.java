package hotsource.exception;

public class NoticeCommentException extends RuntimeException{

	public NoticeCommentException(String msg) {
		super(msg);
	}
	public NoticeCommentException(String msg, Throwable e) {
		super(msg, e);
	}
	public NoticeCommentException(Throwable e) {
		super(e);
	}
}
