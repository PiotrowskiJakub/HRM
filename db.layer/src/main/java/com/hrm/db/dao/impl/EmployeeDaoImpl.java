package com.hrm.db.dao.impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hrm.db.dao.EmployeeDao;
import com.hrm.db.model.ActionDone;
import com.hrm.db.model.Comment;
import com.hrm.db.model.Leave;
import com.hrm.db.model.Role;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;
import com.hrm.db.model.UserLog;
import com.hrm.db.model.WorkLog;

@Repository
@Transactional(propagation=Propagation.REQUIRED)
public class EmployeeDaoImpl implements EmployeeDao
{
	@Autowired
	private SessionFactory sf;
	
	public User getUser(String login)
	{
		return (User) sf.getCurrentSession().createCriteria(User.class).add(Restrictions.eq("usrLogin", login)).uniqueResult();
	}
	
	public Task getTask(Integer id)
	{
		return (Task) sf.getCurrentSession().createCriteria(Task.class).add(Restrictions.eq("tskId", id)).uniqueResult();
	}
	
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
	
	public Role getUserRole(String login)
	{
		return getUser(login).getRole();
	}

	public Boolean isUserActive(String login)
	{
		return getUser(login).isUsrActive();
	}

	public Set<Task> getUserTasks(String login)
	{
		return getUser(login).getTasksForTskUsrWorkerId();
	}

	public Set<Comment> getUserComments(String login)
	{
		return getUser(login).getComments();
	}
	
	public Set<Leave> getUserLeaves(String login)
	{
		return getUser(login).getLeavesForLeaUsrId();
	}
	
	public Set<WorkLog> getUserWorkLogs(String login)
	{
		return getUser(login).getWorkLogs();
	}
	
	public Set<Comment> getTaskComments(Integer id)
	{
		return getTask(id).getComments();
	}
	
	public List<UserLog> getAllUserLogs()
	{
		Criteria crt = sf.getCurrentSession().createCriteria(UserLog.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		crt.addOrder(Order.asc("uloDate"));
		return (List<UserLog>) crt.list();
	}
	
	public String getActionDoneName(Integer id)
	{
		ActionDone ad = (ActionDone) sf.getCurrentSession().createCriteria(ActionDone.class).add(Restrictions.eq("adoId", id)).uniqueResult();
		if(ad == null)
			return null;
		return ad.getAdoName();
	}
	
	public void addUserLog(UserLog userLog)
	{
		sf.getCurrentSession().save(userLog);
	}

	public void addUserLeave(String login, Leave leave)
	{
		sf.getCurrentSession().save(leave);
		User user = getUser(login);
		user.getLeavesForLeaUsrId().add(leave);
		sf.getCurrentSession().update(user);
	}
	
	public void addUserWorkLog(String login, WorkLog workLog)
	{
		sf.getCurrentSession().save(workLog);
		User user = getUser(login);
		user.getWorkLogs().add(workLog);
		sf.getCurrentSession().update(user);
	}
	
	public void addTaskComment(Integer id, Comment comment)
	{
		sf.getCurrentSession().save(comment);
		Task task = getTask(id);
		task.getComments().add(comment);
		sf.getCurrentSession().update(task);
	}
}
