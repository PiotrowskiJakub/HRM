package com.hrm.pm;

import java.util.Date;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.ProjectManagerDao;
import com.hrm.db.model.Project;
import com.hrm.db.model.Task;
import com.hrm.db.model.TaskPriority;
import com.hrm.db.model.User;

public class TaskManagement {
	
	private ProjectManagerDao pmDao;
	private String assignee;
	private String priority;
	private String status;
	private String time;
	private String taskid;
	private String description;
	private String creator;
	private String name;
	private String projectid;
	
	public boolean addTask () {
		pmDao = DaoInitializer.getDao(ProjectManagerDao.class);	
		String prio = "";
		
		if(assignee == null || priority == null || status == null || time == null ||
				description == null || creator == null || name == null
				|| projectid == null) {
			return false;
		}
		
		User user = pmDao.getUser(assignee);
		User leader = pmDao.getUser(creator);
		TaskPriority tskPrio = new TaskPriority(prio, priority);
		Project project = pmDao.getProject(projectid);
		Date date = new Date();
		
		
		if(user == null || leader == null || tskPrio == null || project == null) {
			return false;
		}
		
		Task task = new Task(user, leader, name, date, Integer.valueOf(time), Boolean.valueOf(status));
		task.setProject(project);
		
		return true;
	}
	
	public boolean editTask() {
		pmDao = DaoInitializer.getDao(ProjectManagerDao.class);
		Task task = pmDao.getTask(taskid);
		String prio = "";

		if(assignee == null || priority == null || status == null || time == null ||
				taskid == null || description == null) {
			return false;
		}
		
		User user = pmDao.getUser(assignee);
		
		if(user == null) {
			return false;
		}
		
		if(priority.equals("low")) {
			prio = "Niski";
		} else if(priority.equals("medium")) {
			prio = "Średni";
		} else if(priority.equals("high")) {
			prio = "Wysoki";
		} 
		
		TaskPriority tskPrio = task.getTaskPriority();
		tskPrio.setTprCode(priority);
		tskPrio.setTprName(prio);

		task.setTaskPriority(tskPrio);
		task.setTskDescription(description);
		task.setTskFinished(Boolean.valueOf(status));
		task.setTskTime(Integer.valueOf(time));
		task.setUserByTskUsrWorkerId(user);
		pmDao.editTask(task);
		return true;
	}
	
	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	public String getTaskid() {
		return taskid;
	}
	
	public void setTaskid(String taskid) {
		this.taskid = taskid;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	public String getCreator() {
		return creator;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	
	public String getProjectid() {
		return projectid;
	}
}