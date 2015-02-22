package com.hrm.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.model.Role;
import com.hrm.db.model.Section;
import com.hrm.db.model.User;

public class UserManagement {
	private AdminDao adminDao;
	private String loginName;
	private String name;
	private String surname;
	private String email;
	private String role;
	private String section;
	private String boss;
	
	
	public UserManagement(){
		adminDao = DaoInitializer.getDao(AdminDao.class);
		loginName = "";
		name = "";
		surname = "";
		email = "";
	}
	
	public List<User> getAllUsers(){
		
		List<User> userList = adminDao.getAllUsers();
		
		//System.out.println("pierwszy: " + userList.get(0).getRole().getRolName());
		//System.out.println("ilość: " + userList.size());
		return userList;
	}
	
	public List<Role> getAllRoles(){
		List<Role> rolesList = adminDao.getAllRoles();
		
		return rolesList;
	}
	
	public List<Section> getAllSection(){
		List<Section> sectionsList = adminDao.getAllSection();
		
		return sectionsList;
	}
	
	public void deleteUser(){
		//System.out.println("JESTEM W DELETE");
		adminDao.deleteUser(loginName);
	}
	
	public void editUser(){
		Role usrRole = adminDao.getRoleByName(role);
		Section usrSection = adminDao.getSectionByName(section);
		
		User userToEdit = adminDao.getUser(loginName);
		userToEdit.setUsrName(name);
		userToEdit.setUsrSurname(surname);
		userToEdit.setUsrEmail(email);
		userToEdit.setRole(usrRole);
		userToEdit.setSection(usrSection);
		if(boss.equals("Brak") || boss.equals("Prezes")){
			userToEdit.setUser(null);
		}else{
			User bossUser = adminDao.getUser(boss);
			userToEdit.setUser(bossUser);
		}
		adminDao.editUser(userToEdit);
	}
	
	public void addUser(){
		Role usrRole = adminDao.getRoleByName(role);
		Section usrSection = adminDao.getSectionByName(section);
		
		User userToAdd = new User();
		userToAdd.setUsrLogin(loginName);
		userToAdd.setUsrName(name);
		userToAdd.setUsrSurname(surname);
		userToAdd.setUsrPassword(loginName);
		userToAdd.setUsrEmail(email);
		userToAdd.setUsrActive(true);
		userToAdd.setRole(usrRole);
		userToAdd.setSection(usrSection);
		if(boss.equals("Brak") || boss.equals("Prezes")){
			userToAdd.setUser(null);
		}else{
			User bossUser = adminDao.getUser(boss);
			userToAdd.setUser(bossUser);
		}
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		userToAdd.setUsrDateCreation(date);
		
		
		adminDao.addUser(userToAdd);
		
		
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
	
	public String getRole(){
		return adminDao.getUser(loginName).getRole().getRolName();
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getSection(){
		return adminDao.getUser(loginName).getSection().getSecName();
	}
	
	public void setSection(String section) {
		this.section = section;
	}
	
	public String getBoss(){
		return adminDao.getUser(loginName).getUser().getUsrLogin();
	}
	
	public void setBoss(String boss) {
		this.boss = boss;
	}
	
	public static String getTimeOutput(double tskTime) {
		String result = "";
		int minutes = (int) ((tskTime / (1000*60)) % 60);
		int hours   = (int) ((tskTime / (1000*60*60)) % 24);
		int days   = (int) ((tskTime / (1000*60*60*24)));
		int weeks   = (int) ((tskTime / (1000*60*60*24*7)));
		
		if(weeks > 0) {
			result += weeks + "w ";
		} if(days > 0) {
			result += days + "d ";
		} if(hours > 0) {
			result += hours + "h ";
		} if(minutes > 0) {
			result += minutes + "min ";
		}
		
		return result;
	}
	
}
