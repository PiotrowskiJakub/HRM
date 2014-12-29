package com.hrm.db.conf;

import org.springframework.context.ApplicationContext;

public interface SpringContextBuilder {
	public SpringContextBuilder setDBConfigurationClass(Class<? extends SpringDSConfiguration> clazz);
	public SpringContextBuilder setMainConfigurationClass(Class<? extends SpringAppConfiguration> clazz);
	public SpringContextBuilder addConfigurationClass(Class<?> clazz);
	public SpringContextBuilder setMainBeanClass(Class<? extends MainBean> clazz);
	public ApplicationContext build();
}
