package com.hrm.db.conf.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.hrm.db.conf.MainBean;
import com.hrm.db.conf.SpringAppConfiguration;
import com.hrm.db.conf.SpringContextBuilder;
import com.hrm.db.conf.SpringDSConfiguration;

public class SpringContextBuilderImpl implements SpringContextBuilder {

	private Class<? extends SpringDSConfiguration> dsConfClass;
	private Class<? extends SpringAppConfiguration> confClass;
	private List<Class<?>> confClasses;
	private Class<? extends MainBean> mainBeanClass;
	
	public SpringContextBuilderImpl() {
		this.dsConfClass = PropsSpringDSConfiguration.class;
		this.confClass = DefaultDesktopSpringAppConf.class;
		this.confClasses = new ArrayList<Class<?>>();
	}

	public SpringContextBuilder setDBConfigurationClass(
			Class<? extends SpringDSConfiguration> clazz) {
		this.dsConfClass = clazz;
		return this;
	}

	public SpringContextBuilder setMainConfigurationClass(
			Class<? extends SpringAppConfiguration> clazz) {
		this.confClass = clazz;
		return this;
	}
	
	public SpringContextBuilder addConfigurationClass(Class<?> clazz) {
		this.confClasses.add(clazz);
		return this;
	}

	public SpringContextBuilder setMainBeanClass(Class<? extends MainBean> clazz) {
		this.mainBeanClass = clazz;
		return this;
	}

	public ApplicationContext build() {
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
		ctx.register(this.dsConfClass);
		ctx.register(this.confClass);
		for (Class<?> clazz : this.confClasses) {
			ctx.register(clazz);
		}
		ctx.refresh();
		if (this.mainBeanClass != null) {
			ctx.register(this.mainBeanClass);
			MainBean mainBean = ctx.getBean(this.mainBeanClass);
			mainBean.run();
		}
		return ctx;
	}

}
