package com.hrm.admin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.model.Project;
import com.hrm.db.model.Role;
import com.hrm.db.model.Section;
import com.hrm.db.model.User;

public class ProjectManagement {
	private AdminDao adminDao;
	private String projectName;
	private String description;

	public ProjectManagement(){
		adminDao = DaoInitializer.getDao(AdminDao.class);
		projectName = "";
		description = "";
	}
	
	public void deleteProject(){
		//adminDao.deleteProject(projectName);
	}
	
	
	public void addProject(){		
		Project projectToAdd = new Project();
		
		projectToAdd.setPrjName(projectName);
		projectToAdd.setPrjCode(projectName.toLowerCase());
		projectToAdd.setPrjDescription(description);
		projectToAdd.setPrjFinished(false);		
		//adminDao.addProject(projectToAdd);

	}
	
	
	
}
