package com.hrm.admin;

import java.util.List;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.model.User;;

public class UserManagement {
	private AdminDao adminDao;
	
	
	public UserManagement(){
		adminDao = DaoInitializer.getDao(AdminDao.class);
	}
	
	public void show(){
		
		List<User> userList = adminDao.getAllUsers();
		
		System.out.println("pierwszy: " + userList.get(0).getUsrLogin());
		System.out.println("ilość: " + userList.size());
	}
	
	
}
