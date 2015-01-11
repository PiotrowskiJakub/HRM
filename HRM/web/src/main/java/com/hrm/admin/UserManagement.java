package com.hrm.admin;

import java.util.List;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.model.User;

public class UserManagement {
	private AdminDao adminDao;
	private String loginName;
	private String name;
	private String surname;
	private String email;
	
	
	public UserManagement(){
		adminDao = DaoInitializer.getDao(AdminDao.class);
		loginName = "";
		name = "";
		surname = "";
		email = "";
	}
	
	public List<User> show(){
		
		List<User> userList = adminDao.getAllUsers();
		
		//System.out.println("pierwszy: " + userList.get(0).getRole().getRolName());
		//System.out.println("ilość: " + userList.size());
		return userList;
	}
	
	public void deleteUser(){
		//System.out.println("JESTEM W DELETE");
		adminDao.deleteUser(loginName);
	}
	
	public void editUser(){
		User userToEdit = adminDao.getUser(loginName);
		userToEdit.setUsrName(name);
		userToEdit.setUsrSurname(surname);
		userToEdit.setUsrEmail(email);
		adminDao.editUser(userToEdit);
	}
	
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
	public void changeUserStatus(){
		adminDao.changeUserStatus(loginName);
	}
	
	public String getName(){
		return adminDao.getUser(loginName).getUsrName();
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSurname(){
		return adminDao.getUser(loginName).getUsrSurname();
	}
	
	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	public String getEmail(){
		return adminDao.getUser(loginName).getUsrEmail();
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
}
