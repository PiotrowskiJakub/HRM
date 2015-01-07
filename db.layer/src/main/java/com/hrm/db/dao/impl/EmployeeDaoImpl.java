package com.hrm.db.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hrm.db.dao.EmployeeDao;
import com.hrm.db.model.User;

@Repository
@Transactional(propagation=Propagation.REQUIRED)
public class EmployeeDaoImpl implements EmployeeDao
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

}
