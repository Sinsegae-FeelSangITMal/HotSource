package hotsource.spring.config;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jndi.JndiTemplate;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/*
 * 애플리케이션 Scope 수준에서 관리될 빈즈들의 대한 설정파일
 */
@Configuration // xml 설정 파일 대신, 설정 역할을 하겠다
@EnableTransactionManagement
@ComponentScan(basePackages= {"hotsource.model", "hotsource.util"})
public class RootConfig{
	
	// 어떤 데이터베이스를 사용할 지를 선택
		public DataSource dataSource() throws NamingException {
			JndiTemplate jndi = new JndiTemplate();
			return jndi.lookup("java:comp/env/jndi/mysql", DataSource.class);
		}
		
		// Mybatis에 사용할 트랜잭션 매니저 선택
		@Bean
		public PlatformTransactionManager platformTransactionManager(SqlSessionFactory sqlSessionFactory) {
			return new DataSourceTransactionManager(sqlSessionFactory.getConfiguration().getEnvironment().getDataSource());
		}
		
		// Mybatis의 SqlSession이 모여져 있는, SqlSessionFactory를 빈으로 등록
		@Bean
		public SqlSessionFactory sqlSessionFactory() throws Exception {
			SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
			sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("hotsource/mybatis/mybatis-config.xml")); // mybatis 설정파일 위치
			
			//SqlSessionFactoryBean 에게 사용할 DB를 알려줘야 함
			sqlSessionFactoryBean.setDataSource(dataSource());
			return sqlSessionFactoryBean.getObject();
		}
		
		@Bean
		public SqlSessionTemplate sqlSessionTemplate() throws Exception {
			return new SqlSessionTemplate(sqlSessionFactory());
		}
		
}
