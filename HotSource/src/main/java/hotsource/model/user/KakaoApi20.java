package hotsource.model.user;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoApi20 extends DefaultApi20{

	private static final String AUTHORIZE_URL = "https://kauth.kakao.com/oauth/authorize";
	private static final String ACCESS_TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	
	protected KakaoApi20() {}
	private static class InstanceHolder {
		private static final KakaoApi20 INSTANCE = new KakaoApi20();
	}
	
	public static KakaoApi20 instance() {
		return InstanceHolder.INSTANCE;
	}
	
	
	@Override
	protected String getAuthorizationBaseUrl() {
		return AUTHORIZE_URL;
	}
	
	@Override
	public String getAccessTokenEndpoint() {
		return ACCESS_TOKEN_URL;
	}

}
