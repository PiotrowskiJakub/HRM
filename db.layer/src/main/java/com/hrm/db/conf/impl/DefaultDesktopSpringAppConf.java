package com.hrm.db.conf.impl;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.support.AbstractPlatformTransactionManager;

import com.hrm.db.conf.SpringAppConfiguration;

@ComponentScan(basePackages = "com.hrm.*")
@EnableTransactionManagement
public class DefaultDesktopSpringAppConf implements SpringAppConfiguration {

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
		hibernateProperties.put("hibernate.dialect",
				"org.hibernate.dialect.MySQLDialect");
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
