package com.hrm.pm;

import java.util.Date;

import com.hrm.DaoInitializer;
import com.hrm.db.dao.ProjectManagerDao;
import com.hrm.db.model.Comment;

public class CommentManagement {
	
	private ProjectManagerDao pmDao;
	private String comid;
	private String comtaskid;
	private String comusrid;
	private String comcomment;
	private String comdate;
	
	public void addComment() {
		pmDao = DaoInitializer.getDao(ProjectManagerDao.class);
		Comment com = new Comment();
		com.setComComment(comcomment);
		com.setComDate(new Date());
		com.setUser(pmDao.getUser(comusrid));
		com.setTask(pmDao.getTask(comtaskid));
		pmDao.addComment(com);
	}
	
	public void setComid (String comid) {
		this.comid = comid;
	}
	
	public String getComid () {
		return this.comid;
	}
	
	public void setComtaskid (String comtaskid) {
		this.comtaskid = comtaskid;
	}
	
	public String getComtaskid () {
		return this.comtaskid;
	}
	
	public void setComusrid (String comusrid) {
		this.comusrid = comusrid;
	}
	
	public String getComusrid () {
		return this.comusrid;
	}
	
	public void setComcomment (String comcomment) {
		this.comcomment = comcomment;
	}
	
	public String getComcomment () {
		return this.comcomment;
	}
	
	public void setComdate (String comdate) {
		this.comdate = comdate;;
	}
	
	public String getComdate () {
		return this.comdate;
	}
	
}