package hotsource.spring.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/*
 * 스프링의 고전적 설정을 담당하는 xml을 대신하는 java class
*/
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "hotsource.controller" })
public class MainWebConfig extends WebMvcConfigurerAdapter{


	/*
	 * 하위 컨트롤러가 3, 4단계를 수행한 후, DispatcherServlet에게 정확한 파일명을 알려주는 게 아니라 파일의 일부 단서만
	 * 반환한다(ModelAndView에 심어서), 따라서 이 객체를 넘겨받은 DispatcherServlet은 일부 단서를 직접 해석하지 않고,
	 * View에 대한 해석을 담당하는 전담객체에 맡긴다.. 이 View 영역을 전담하는 객체들을 가리켜 스프링에서는 ViewResolver라
	 * 한다. JSP 사용시 주로 사용되는 ViewResolver는 InternalResourceViewResolver
	 * 
	 * 예시 ) 하위 컨트롤러가 notice/list를 심어서 보내면 -->/WEB-INF/views/notice/list.jsp
	 */

	/*
	 * <bean id="handlerMapping" class="SimpleUrlHandlerMapping"></bean> <bean
	 * id="handlerMapping" class="DefaultAnnotationHandlerMapping"></bean>
	 */
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(new MappingJackson2HttpMessageConverter());
	}
	
}
