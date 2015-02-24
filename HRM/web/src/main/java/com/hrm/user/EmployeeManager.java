package com.hrm.user;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.hrm.DAOFactory;

import com.hrm.db.dao.EmployeeDao;
import com.hrm.db.model.Comment;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;
import com.hrm.db.model.UserLog;
import com.hrm.db.model.WorkLog;
import com.hrm.observer.ActionDone;

public class EmployeeManager {
	private EmployeeDao employeeDao;
	private String loginName;
	private User user;
	
	public EmployeeManager(String loginName){
		employeeDao = DAOFactory.getEmployeeDAO();
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
	
//	public String getFullName(Integer id){
//		return employeeDao.getUser(id).getUsrName() + " " + employeeDao.getUser(id).getUsrSurname();
//	}
	
	public Set<Task> getAllTasks(){
		return employeeDao.getUserTasks(loginName);
	}
	
	public Set<Comment> getAllComentsToTask(Integer id){
		return employeeDao.getTaskComments(id);
	}
	
	public Set<Comment> getAllComents(){
		return employeeDao.getUserComments(loginName);
	}
	public void  addComment(Integer idTask, String commentValue){
		Task task = employeeDao.getTask(idTask);
		Comment comment = new Comment(task, getUser(), commentValue, new Date());
		employeeDao.addTaskComment(idTask, comment);
	}
	
	public Task getCurrentTask(Integer id){
		return employeeDao.getTask(id);
	}
	
	public Set<Map.Entry<String,Integer[]>> getAllTitlesTask(){
		HashMap<String, Integer[]> tmp = new HashMap<String, Integer[]>();
		Date now = new Date();
		for(Task currentTask : getAllTasks()){
			Integer [] tmpInt = {
					employeeDao.getTaskComments(currentTask.getTskId()).size(),
					(int)((now.getTime() - currentTask.getTskCreationDate().getTime())/(1000*60))
			};
			tmp.put(currentTask.getNazwa(),tmpInt);
		}
		return tmp.entrySet();
	}
	
	public void addWorkLogs(String taskId, String comment, String hours, String minutes){
		double minutesDouble = Double.parseDouble(hours)*60.0 + Double.parseDouble(minutes); 
		WorkLog workLog = new WorkLog(employeeDao.getTask(Integer.parseInt(taskId)), user, comment, new Date(), minutesDouble);
		employeeDao.addUserWorkLog(user.getUsrLogin(), workLog);
	}
	
	public void addLog(ActionDone actionDone, User userWhoAdd, User userWhoViewd){
		UserLog userLog = new UserLog(employeeDao.getActionDone(actionDone.ordinal()), userWhoAdd, userWhoViewd, new Date());
		employeeDao.addUserLog(userLog);
	}
	
	public List<UserLog> getAllUserLogs(){
		return employeeDao.getAllUserLogs();
	}
	public Set<WorkLog> getAllWorkLogs(){
		return employeeDao.getUserWorkLogs(user.getUsrLogin());
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
