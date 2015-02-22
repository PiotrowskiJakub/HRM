package com.hrm.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.hrm.db.conf.impl.DefaultSpringAppConfiguration;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.dao.EmployeeDao;
import com.hrm.db.model.UserLog;

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
		EmployeeDao adminDao = getBean(EmployeeDao.class);
		System.out.println(adminDao.getActionDoneName(2));
	}
}
