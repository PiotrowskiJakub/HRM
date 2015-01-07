package com.hrm.db.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hrm.db.dao.AdminDao;
import com.hrm.db.model.Project;
import com.hrm.db.model.Role;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;

@Repository
@Transactional(propagation=Propagation.REQUIRED)
public class AdminDaoImpl implements AdminDao
{
	@Autowired
	private SessionFactory sf;
	
	public List<User> getAllUsers()
	{
		Criteria crt = sf.getCurrentSession().createCriteria(User.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (List<User>) crt.list();
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
	
	public Set<Project> getUserProjects(String login)
	{
		return getUser(login).getProjects();
	}

	public Set<Task> getUserTasks(String login)
	{
		return getUser(login).getTasksForTskUsrWorkerId();
	}
	
	public void changeUserStatus(String login)
	{
		User user = getUser(login);
		Boolean usrActive = user.isUsrActive();
		user.setUsrActive(!usrActive);
		editUser(user);
	}
}
