package hotsource.exception;

public class RoleException extends RuntimeException{

	public RoleException(String msg) {
		super(msg);
	}
	public RoleException(String msg, Throwable e) {
		super(msg, e);
	}
	public RoleException(Throwable e) {
		super(e);
	}
}
