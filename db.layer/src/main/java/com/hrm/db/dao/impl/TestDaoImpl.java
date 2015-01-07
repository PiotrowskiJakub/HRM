package com.hrm.db.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hrm.db.dao.TestDao;
import com.hrm.db.model.Project;
import com.hrm.db.model.Role;
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
		Criteria crt = sf.getCurrentSession().createCriteria(User.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<User> users = (List<User>) crt.list();
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

	public List<User> getAllUsers()
	{
		Criteria crt = sf.getCurrentSession().createCriteria(User.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return crt.list();
	}

	public Role getRole(String code)
	{
		return (Role) sf.getCurrentSession().createCriteria(Role.class).add(Restrictions.eq("rolCode", code)).uniqueResult();
	}
	
	public void addUser(User user)
	{
		sf.getCurrentSession().save(user);
	}

	public void deleteUser(String login)
	{
		User user = (User) sf.getCurrentSession().createCriteria(User.class).add(Restrictions.eq("usrLogin", login)).uniqueResult();
		sf.getCurrentSession().delete(user);
	}
	
	public User getUser(String login)
	{
		return (User) sf.getCurrentSession().createCriteria(User.class).add(Restrictions.eq("usrLogin", login)).uniqueResult();
	}

	public void editUser(User user)
	{
		sf.getCurrentSession().update(user);
	}

	public void changeUserStatus(String login)
	{
		User user = (User) sf.getCurrentSession().createCriteria(User.class).add(Restrictions.eq("usrLogin", login)).uniqueResult();
		Boolean usrActive = user.isUsrActive();
		user.setUsrActive(!usrActive);
		editUser(user);
	}
}
