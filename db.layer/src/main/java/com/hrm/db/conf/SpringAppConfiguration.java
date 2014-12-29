package com.hrm.db.conf;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.support.AbstractPlatformTransactionManager;

public interface SpringAppConfiguration {
	@Bean
	public FactoryBean<SessionFactory> sessionFactory();
	@Bean
	public AbstractPlatformTransactionManager transactionManager();
}
