package com.hrm.db.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hrm.db.dao.TestDao;
import com.hrm.db.model.Project;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;

@Repository
@Transactional(propagation=Propagation.REQUIRED)
public class TestDaoImpl implements TestDao
{
	@Autowired
	private SessionFactory sf;
	
	public Boolean checkUser(String login, String password)
	{
		List<User> users=(List<User>)sf.getCurrentSession().createCriteria(User.class).list();
		for(User usr : users)
		{
			if(usr.getUsrLogin().equals(login) && usr.getUsrPassword().equals(password))
				return true;
		}
		
		return false;
	}

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
