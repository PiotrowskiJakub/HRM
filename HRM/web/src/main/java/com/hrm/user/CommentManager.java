package com.hrm.user;

import com.hrm.db.model.User;

public class CommentManager {
	private String commentValue;
	private String idTask; 
	private String idUser;
	private EmployeeManager employeeManager; 
	
	public CommentManager(){
		setEmployeeManager(null);
		setCommentValue("");
		setIdTask("");
		setIdUser("");
	}
	
	public String getCommentValue(){
		return commentValue;
	}
	
	public void setCommentValue(String commentValue){
		this.commentValue = commentValue;
	}
	
	public String getIdTask() {
		return idTask;
	}
	public void setIdTask(String idTask) {
		this.idTask = idTask;
	}
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
	public EmployeeManager getEmployeeManager() {
		return employeeManager;
	}
	public void setEmployeeManager(EmployeeManager employeeManager) {
		this.employeeManager = employeeManager;
	}
	public void createEmployeeManager(){
		employeeManager = new EmployeeManager(idUser);
	}
	
	public void createComment(){
		employeeManager.addComment(Integer.parseInt(idTask), commentValue);
	}
	public User getUser(){
		return employeeManager.getUser();
	}
	
	

}
