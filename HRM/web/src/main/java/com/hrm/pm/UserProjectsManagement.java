package com.hrm.pm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.model.Project;

public class UserProjectsManagement {
	private AdminDao adminDao;
	private String login;
	private List<Project> projects;
	
	
	public UserProjectsManagement(String login){
		this.adminDao = DaoInitializer.getDao(AdminDao.class);
		this.login = login;
		this.projects = new ArrayList<Project>(
				adminDao.getUserProjects(this.login));
		Collections.sort(this.projects, new Comparator<Project>() {
	        public int compare(Project p1, Project p2) {
	            return p1.getPrjName().compareTo(p2.getPrjName());
	         }
	 });
		
	}
	
	public List<Project> getUserProjects(){
		return this.projects;
	}
	
}
