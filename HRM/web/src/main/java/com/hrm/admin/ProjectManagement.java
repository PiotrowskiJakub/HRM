package com.hrm.admin;

import java.util.List;

import com.hrm.DAOFactory;
import com.hrm.db.dao.AdminDao;
import com.hrm.db.model.Project;

public class ProjectManagement {
	private AdminDao adminDao;
	private String projectName;
	private String description;

	public ProjectManagement(){
		adminDao = DAOFactory.getAdminDAO();
		projectName = "";
		description = "";
	}
	
	
	public List<Project> getAllProjects(){
		
		List<Project> projectList = adminDao.getProjects();
		
		return projectList;
	}
	
	public void changeProjectStatus(){
		adminDao.changeProjectStatus(projectName);
	}
	
	
	
	public void editProject(){
		Project projectToEdit = adminDao.getProject(projectName);
		
		projectToEdit.setPrjName(projectName);
		projectToEdit.setPrjCode(projectName.toLowerCase());
		projectToEdit.setPrjDescription(description);
		projectToEdit.setPrjFinished(false);
		
		adminDao.editProject(projectToEdit);
	}
	
	
	
	public void deleteProject(){
		System.out.print("Nazwa projektu: " + projectName);
		adminDao.deleteProject(projectName);
	}
	
	public String getProjectName(){
		return projectName;
	}
	
	public void setProjectName(String projectName){
		this.projectName = projectName;
	}
	
	public String getDecription(){
		return adminDao.getProject(projectName).getPrjDescription();
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	
	
	public void addProject(){		
		Project projectToAdd = new Project();
		
		projectToAdd.setPrjName(projectName);
		projectToAdd.setPrjCode(projectName.toLowerCase());
		projectToAdd.setPrjDescription(description);
		projectToAdd.setPrjFinished(false);		
		adminDao.addProject(projectToAdd);

	}
	
	
	
}
