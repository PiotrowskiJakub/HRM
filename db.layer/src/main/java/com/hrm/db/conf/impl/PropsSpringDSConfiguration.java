package com.hrm.db.conf.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.FileSystemResource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.hrm.db.conf.SpringDSConfiguration;

public class PropsSpringDSConfiguration implements SpringDSConfiguration {
	
	@Value("${jdbc.driverClassName}") String driverClassName;
	@Value("${jdbc.url}") String url;
	@Value("${jdbc.username}") String username;
	@Value("${jdbc.password}") String password;

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(this.driverClassName);
        dataSource.setUrl(this.url);
        dataSource.setUsername(this.username);
        dataSource.setPassword(this.password);
        return dataSource;
	}
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer properties() {
		PropertySourcesPlaceholderConfigurer props = new PropertySourcesPlaceholderConfigurer();
		props.setLocation(new FileSystemResource("database.properties"));
		return props;
	}

}
