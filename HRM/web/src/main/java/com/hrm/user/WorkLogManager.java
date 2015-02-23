package com.hrm.user;

import com.hrm.db.model.User;

public class WorkLogManager {
	private EmployeeManager employeeManager; 
	private String userId;
	private String taskId;
	private String hours;
	private String minutes;
	private String comment;
	
	public WorkLogManager(){
		setEmployeeManager(null);
		setUserId("");
		setTaskId("");
		setHours("");
		setMinutes("");
		setComment("");
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getMinutes() {
		return minutes;
	}
	public void setMinutes(String minutes) {
		this.minutes = minutes;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public EmployeeManager getEmployeeManager() {
		return employeeManager;
	}
	public void setEmployeeManager(EmployeeManager employeeManager) {
		this.employeeManager = employeeManager;
	}
	
	public void createEmployeeManager(){
		employeeManager = new EmployeeManager(userId);
	}
	
	public void createWorkLog(){
		employeeManager.addWorkLogs(taskId, comment, hours, minutes);
	}
	
	public User getUser(){
		return employeeManager.getUser();
	}
}
