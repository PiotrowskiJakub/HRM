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
	
	public User getUser(String login)
	{
		return (User) sf.getCurrentSession().createCriteria(User.class).add(Restrictions.eq("usrLogin", login)).uniqueResult();
	}
	
	public Set<Project> getUserProjects(String login)
	{	
		return getUser(login).getProjects();
	}
	
	public Set<Task> getUserTasks(String login)
	{	
		return getUser(login).getTasksForTskUsrWorkerId();
	}
	
	public Project getProject(String name)
	{
		return (Project) sf.getCurrentSession().createCriteria(Project.class).add(Restrictions.eq("prjName", name)).uniqueResult();
	}
}
