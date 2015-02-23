package com.hrm.admin;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.Set;

import com.hrm.DAOFactory;
import com.hrm.db.dao.ProjectManagerDao;
import com.hrm.db.model.Comment;
import com.hrm.db.model.Task;
import com.hrm.db.model.WorkLog;

public class ActivityManagement {
	private ProjectManagerDao projectManagerDao;
	
	public ActivityManagement(){
		projectManagerDao = DAOFactory.getProjectManagerDAO();
	}
	
	public LinkedList<UserRegistration> getAllUserRegistrations(String login){
		
		LinkedList<UserRegistration> allRegistration = new LinkedList<UserRegistration>();
		
		Set<Task> allTasks =  projectManagerDao.getUserTasks(login);
		
		for(Task tsk : allTasks){
			for(WorkLog wlog : tsk.getWorkLogs()){
				allRegistration.add(new WorkLogAdapter(wlog));
			}
			
			for(Comment comment : tsk.getComments()){
				allRegistration.add(new CommentAdapter(comment));
			}
		}
		
		Collections.sort(allRegistration, new Comparator<UserRegistration>() {
	        public int compare(UserRegistration u1, UserRegistration u2) {
	            if (u1.getCreateDate().after(u2.getCreateDate())) {
	            	return 1;
	            } else {
	            	return -1;
	            }
	         }
		});
		
		return allRegistration;
	}
}
