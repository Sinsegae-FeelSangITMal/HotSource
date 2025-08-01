package hotsource.spring.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

import hotsource.model.user.KakaoApi20;
import hotsource.model.user.NaverApi20;

/*
 * 스프링의 고전적 설정을 담당하는 xml을 대신하는 java class
*/
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "hotsource.controller.main, hotsource.util" })
@PropertySource("classpath:application.properties")
public class MainWebConfig extends WebMvcConfigurerAdapter{

	@Value("${google.clientId}")
	private String goo_clientId;

	@Value("${google.clientSecret}")
	private String goo_clientSecret;

	@Value("${google.redirectUri}")
	private String goo_redirectUri;
	
	@Value("${naver.clientId}")
	private String nav_clientId;

	@Value("${naver.clientSecret}")
	private String nav_clientSecret;

	@Value("${naver.redirectUri}")
	private String nav_redirectUri;
	
	@Value("${kakao.clientId}")
	private String kak_clientId;

	@Value("${kakao.clientSecret}")
	private String kak_clientSecret;

	@Value("${kakao.redirectUri}")
	private String kak_redirectUri;
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Bean
	public OAuth20Service googleAuthService() {
		ServiceBuilder builder = new ServiceBuilder(goo_clientId);
		builder.apiSecret(goo_clientSecret); 
		builder.defaultScope("email profile openid");
		builder.callback(goo_redirectUri);
		return builder.build(GoogleApi20.instance());
	}
	
	@Bean
	public OAuth20Service naverAuthService() {
		ServiceBuilder builder = new ServiceBuilder(nav_clientId);
		builder.apiSecret(nav_clientSecret); 
		builder.defaultScope("name email");
		builder.callback(nav_redirectUri);
		return builder.build(NaverApi20.instance());
	}
	@Bean
	public OAuth20Service kakaoAuthService() { // kakao 안됨 
		ServiceBuilder builder = new ServiceBuilder(kak_clientId);
		builder.apiSecret(kak_clientSecret);
		builder.defaultScope("profile_nickname profile_image");
		builder.callback(kak_redirectUri);
		return builder.build(KakaoApi20.instance());
	}
	
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(new MappingJackson2HttpMessageConverter());
	}
	
	
}
