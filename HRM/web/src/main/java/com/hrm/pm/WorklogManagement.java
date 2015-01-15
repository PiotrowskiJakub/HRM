package com.hrm.pm;

import java.util.Date;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.ProjectManagerDao;

public class WorklogManagement {
	
	private ProjectManagerDao adminDao;
	private String wloUser;
	private String wloTask;
	private String wloTime;
	private String wloDate;
	private String wloComment;
	
	
	public WorklogManagement(){
		adminDao = DaoInitializer.getDao(ProjectManagerDao.class);
		wloUser = "";
		wloTask = "";
		wloTime = "";
		wloDate = "";
		wloComment = "";
	}
	
	public void addWorklog() {
	}
}
