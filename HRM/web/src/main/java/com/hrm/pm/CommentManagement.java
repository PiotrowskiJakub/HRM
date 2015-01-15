package com.hrm.pm;

import java.util.Date;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.ProjectManagerDao;
import com.hrm.db.model.Comment;
import com.hrm.db.model.User;

public class CommentManagement {
	
	private ProjectManagerDao adminDao;
	private String comid;
	private String comtaskid;
	private String comusrid;
	private String comcomment;
	private String comdate;
	
	
	public CommentManagement(){
		adminDao = DaoInitializer.getDao(ProjectManagerDao.class);
		comid = "";
		comtaskid = "";
		comusrid = "";
		comcomment = "";
		comdate = "";
	}
	
	public void addComment() {
		Comment com = new Comment();
		com.setComComment(comcomment);
		com.setComDate(new Date());
		com.setUser(adminDao.getUser(comusrid));
		//com.setTask(adminDao.getTask(comtaskid));
		//adminDao.addComment(com);
	}
}