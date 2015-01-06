package com.hrm.db.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hrm.db.dao.ProjectManagerDao;

@Repository
@Transactional(propagation=Propagation.REQUIRED)
public class ProjectManagerDaoImpl implements ProjectManagerDao
{
	@Autowired
	private SessionFactory sf;
	
	
}
