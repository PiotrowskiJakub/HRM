package com.hrm.db.conf.impl;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.support.AbstractPlatformTransactionManager;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.hrm.db.conf.SpringAppConfiguration;

@Import(JndiSpringDSConf.class)
//@Import(ClassPathPropsSpringDSConf.class)	// import przy testowaniu bez serwera
@ComponentScan(basePackages = "com.hrm.*")
@EnableTransactionManagement
@EnableWebMvc
public class DefaultSpringAppConfiguration implements SpringAppConfiguration {

	@Autowired
	private DataSource dataSource;
	@Autowired
	private SessionFactory sessionFactory;

	@Bean
	public FactoryBean<SessionFactory> sessionFactory() {
		LocalSessionFactoryBean sfBean = new LocalSessionFactoryBean();
		sfBean.setDataSource(dataSource);
		sfBean.setPackagesToScan("com.hrm.db.model");
		Properties hibernateProperties = new Properties();
//		hibernateProperties.put("hibernate.dialect",
//				"org.hibernate.spatial.dialect.postgis.PostgisDialect");
		hibernateProperties.put("show_sql",
				"true");
		sfBean.setHibernateProperties(hibernateProperties);
		return sfBean;
	}

	@Bean
	public AbstractPlatformTransactionManager transactionManager() {
		HibernateTransactionManager tm = new HibernateTransactionManager();
		tm.setSessionFactory(sessionFactory);
		return tm;
	}

}
