package com.hrm;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.hrm.db.conf.impl.DefaultSpringAppConfiguration;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.dao.EmployeeDao;
import com.hrm.db.dao.ProjectManagerDao;

public class DAOFactory {
    private static ApplicationContext ctx = new AnnotationConfigApplicationContext(
	    DefaultSpringAppConfiguration.class);

    private static <T> T getDao(Class<T> clazz) {
	return ctx.getBean(clazz);
    }

    public static AdminDao getAdminDAO() {
	return getDao(AdminDao.class);
    }

    public static EmployeeDao getEmployeeDAO() {
	return getDao(EmployeeDao.class);
    }

    public static ProjectManagerDao getProjectManagerDAO() {
	return getDao(ProjectManagerDao.class);
    }
}
