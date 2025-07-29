package hotsource.spring.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

import lombok.extern.slf4j.Slf4j;


@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"hotsource.controller.user"})
//@PropertySource("classpath:application.properties") 
@Slf4j
public class UserWebConfig {
	/*
	@Value("${google.clientId}")
	private String clientId;

	@Value("${google.clientSecret}")
	private String clientSecret;

	@Value("${google.redirectUri}")
	private String redirectUri;
*/
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
/*
	@Bean
	public OAuth20Service googleAuthService() {
		// 클라이언트 ID, Secret, 콜백 주소, 리소스owner 접근 범위
		//여기에 코드추가해야함 
		ServiceBuilder builder = new ServiceBuilder(clientId);
		builder.apiSecret(clientSecret); // 값 입력
		builder.defaultScope("email profile openid");
		builder.callback(redirectUri);
		log.debug("redirectURI:" +redirectUri);
		return builder.build(GoogleApi20.instance());
	}*/
}













