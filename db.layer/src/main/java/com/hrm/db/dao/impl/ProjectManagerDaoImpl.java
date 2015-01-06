package com.hrm.db.dao.impl;

import java.util.Set;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hrm.db.dao.ProjectManagerDao;
import com.hrm.db.model.Project;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;

@Repository
@Transactional(propagation=Propagation.REQUIRED)
public class ProjectManagerDaoImpl implements ProjectManagerDao
{
	@Autowired
	private SessionFactory sf;
	
	public Set<Project> getUserProjects(String login)
	{
		User user = (User) sf.getCurrentSession().createCriteria(User.class).add(Restrictions.eq("usrLogin", login)).uniqueResult();
		
		return user.getProjects();
	}
	
	public Set<Task> getUserTasks(String login)
	{
		User user = (User) sf.getCurrentSession().createCriteria(User.class).add(Restrictions.eq("usrLogin", login)).uniqueResult();
		
		return user.getTasksForTskUsrWorkerId();
	}
}
