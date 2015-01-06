package com.hrm;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.hrm.db.conf.impl.DefaultSpringAppConfiguration;

public class DaoInitializer
{
	private static ApplicationContext ctx=new AnnotationConfigApplicationContext(DefaultSpringAppConfiguration.class);
	
	public static<T> T getDao(Class<T> clazz)
	{
		return ctx.getBean(clazz);
	}
}
