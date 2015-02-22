package com.hrm.pm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.ProjectManagerDao;
import com.hrm.db.model.Task;
import com.hrm.db.model.User;
import com.hrm.db.model.WorkLog;

public class WorklogManagement {
	
	private ProjectManagerDao pmDao;
	private String wloUser;
	private String wloTask;
	private String wloTime;
	private String wloDate;
	private String wloComment;
	
	public boolean addWorklog() {

		pmDao = DaoInitializer.getDao(ProjectManagerDao.class);
		Task task = pmDao.getTask(wloTask);
		User user = pmDao.getUser(wloUser);
		Date date;
		
		if(task == null || user == null || wloDate == null || wloTime == null) {
			return false;
		} else {
			try {
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				date = formatter.parse(wloDate);
			} catch (ParseException e) {
				System.out.println("formater zjebal");
				date = new Date();
				e.printStackTrace();
			}
			
			double time = (double) Integer.valueOf(wloTime);
			WorkLog log = new WorkLog(task, user, wloComment, date, time);
			pmDao.addWorkLog(log);
			return true;
		}
	}
	
	public String getWloUser () {
		return this.wloUser;
	}
	
	public void setWloUser (String wloUser) {
		this.wloUser = wloUser;
	}
	
	public String getWloTask () {
		return this.wloTask;
	}
	
	public void setWloTask (String wloTask) {
		this.wloTask = wloTask;
	}
	
	public String getWloTime () {
		return this.wloTime;
	}
	
	public void setWloTime (String wloTime) {
		this.wloTime = wloTime;
	}
	
	public String getWloDate () {
		return this.wloDate;
	}
	
	public void setWloDate (String wloDate) {
		this.wloDate = wloDate;
	}
	
	public String getWloComment() {
		return this.wloComment;
	}
	
	public void setWloComment (String wloComment) {
		this.wloComment = wloComment;
	}
	
}