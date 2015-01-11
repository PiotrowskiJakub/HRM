package com.hrm.user;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.EmployeeDao;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;

public class EmployeeManager {
	private EmployeeDao employeeDao;
	private String loginName;
	private User user;
	
	public EmployeeManager(String loginName){
		employeeDao = DaoInitializer.getDao(EmployeeDao.class);
		this.loginName = loginName;
		user = employeeDao.getUser(loginName);		
	}
	
	public User getUser(){
		return user;
	}
	
	public String getFullName(){
		return user.getUsrName() + " " + user.getUsrSurname();
	}
	
	public String getEmail(){
		return user.getUsrEmail();
	}
	
	public Set<Map.Entry<String,Integer[]>> getAllTitlesTask(){
		HashMap<String, Integer[]> tmp = new HashMap<String, Integer[]>();
		Date now = new Date();
		for(Task currentTask : employeeDao.getUserTasks(loginName)){
			Integer [] tmpInt = {
					employeeDao.getTaskComments(currentTask.getTskId()).size(),
					(int)(((now.getTime() - currentTask.getTskCreationDate().getTime())/(1000*60)) % 60)
			};
			
			tmp.put(currentTask.getNazwa(),tmpInt);
		}
		return tmp.entrySet();
	}
	
	public String getTimeString(int minutes){
		if(minutes < 60){
			if(minutes == 1)
				return "jedną minutę temu";
			if(minutes == 2)
				return "dwie minuty temu";
			if(minutes == 3)
				return "trzy minuty temu";
			if(minutes == 4)
				return "cztery minuty temu";
			
			return minutes + " minut temu";
		}else if(minutes < 1440){
			if(minutes < 2 * 60)
				return "godzinę temu";
			if(minutes < 3 * 60)
				return "dwie godziny temu";
			if(minutes == 4 * 60)
				return "trzy godziny temu";
			if(minutes == 5 * 60)
				return "cztery godziny temu";
			
			return (int)(minutes/60) + " godzin temu";
		}else{
			if(minutes < 2 * 60*24)
				return "dzień temu";
			if(minutes < 3 * 60*24)
				return "dwa dni temu";
			if(minutes == 4 * 60*24)
				return "trzy dni temu";
			if(minutes == 5 * 60*24)
				return "cztery dni temu";
			return (int)(minutes / (60 * 24)) + " dni temu";
		}
		
	}
	
	
	
	
	
	
	
	

}