package com.hrm.db.conf;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;

public interface SpringDSConfiguration {
	@Bean
	public DataSource dataSource();
}
