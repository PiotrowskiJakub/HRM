package com.hrm.db.conf.impl;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;

import com.hrm.db.conf.SpringDSConfiguration;

public class JndiSpringDSConf implements SpringDSConfiguration {

	@Bean
	public DataSource dataSource() {
        JndiDataSourceLookup dsLookup = new JndiDataSourceLookup();
        dsLookup.setResourceRef(true);
        DataSource dataSource = dsLookup.getDataSource("java:jboss/datasources/HrmDS");
        return dataSource;
	}

}
