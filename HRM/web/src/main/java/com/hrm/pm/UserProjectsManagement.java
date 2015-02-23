package com.hrm.pm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.hrm.DAOFactory;
import com.hrm.db.dao.ProjectManagerDao;
import com.hrm.db.model.Project;
import com.hrm.db.model.Task;

public class UserProjectsManagement {
	private ProjectManagerDao adminDao;
	private String login;
	private List<Project> projects;
	
	
	public UserProjectsManagement(String login){
		this.adminDao = DAOFactory.getProjectManagerDAO();
		this.login = login;
		this.projects = new ArrayList<Project>(
				adminDao.getUserProjects(this.login));
		
		/* Wzorzec projektowy Strategia */
		Sorter sorter = new Sorter();
		sorter.setSorter(new QuickSort());
		sorter.sort(this.projects, new Comparator<Project>() {
	        public int compare(Project p1, Project p2) {
	            return p1.getPrjName().compareTo(p2.getPrjName());
	         }
		});
		
	}
	
	public List<Project> getUserProjects(){
		return this.projects;
	}
	
	public List<Task> getProjectTasks(String prjName) {
		Project prj = getProject(prjName);
		List<Task> tasks = new ArrayList<Task>(
				prj.getTasks());
		Collections.sort(tasks, new Comparator<Task>() {
	        public int compare(Task t1, Task t2) {
	            return t1.getNazwa().compareTo(t2.getNazwa());
	         }
		});
		
		return tasks;
	}
	
	public Task getTask(String tskName) {

		for(Project p : this.projects) {
			for(Task t : p.getTasks()) {
				if(t.getNazwa().equals(tskName)) {
					return t;
				}
			}
		}
		
		return new Task();
	}
	
	private Project getProject(String prjName) {
		for(Project p : this.projects) {
			if(p.getPrjName().equals(prjName)) {
				return p;
			}
		}
		
		return null;
	}
	
}
