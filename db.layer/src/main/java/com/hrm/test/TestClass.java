package com.hrm.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.hrm.db.conf.impl.DefaultSpringAppConfiguration;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.model.Section;

/**
 * 
 * @author Jakub Piotrowski
 * Testowa klasa
 */
public class TestClass {
	private static ApplicationContext ctx=new AnnotationConfigApplicationContext(DefaultSpringAppConfiguration.class);
	
	public static<T> T getBean(Class<T> clazz)
	{
		return ctx.getBean(clazz);
	}
	
	public static void main(String[] args)
	{
		AdminDao adminDao = getBean(AdminDao.class);
		for(Section s : adminDao.getAllSection())
			System.out.println(s.getSecCode());
	}
}