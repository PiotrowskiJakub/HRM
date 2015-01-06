package com.hrm.login;

import java.util.Hashtable;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.EmployeeDao;

public class checkLogin {
	private EmployeeDao employeeDao;
	private String loginName;
	private String password;
	private Hashtable<String,String> errors;

	public checkLogin() {
		employeeDao = DaoInitializer.getDao(EmployeeDao.class);
		loginName = "";
		password = "";
		errors = new Hashtable<String,String>();
	}

	public boolean validate() {
		boolean isOk = true;
		if (loginName.equals("")) {
			errors.put("loginName", "Please enter your login");
			loginName = "";
			isOk = false;
		}

		if (password.equals("")){
			errors.put("password", "Please enter your password");
			password = "";
			isOk = false;
		}
		return isOk;
	}

	public String getErrorMsg(String s) {
		String errorMsg = (String) errors.get(s.trim());
		return (errorMsg == null) ? "" : errorMsg;
	}
	public boolean isValid(String s){
		String errorMsg = (String) errors.get(s.trim());
		return (errorMsg == null) ? true : false;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
