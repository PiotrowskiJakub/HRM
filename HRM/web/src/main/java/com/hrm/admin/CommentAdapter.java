package com.hrm.admin;

import java.util.Date;

import com.hrm.db.model.Comment;

public class CommentAdapter implements UserRegistration {
	private Comment ref;
	
	public CommentAdapter(Comment ref){
		this.ref = ref;
	}

	@Override
	public String getRegistrationTitle() {
		return "Nazwa projektu: <b>" + ref.getTask().getProject().getPrjName() + "</b><br />Nazwa zadania: <b>" + ref.getTask().getNazwa() + "</b><br /> Data wpisu: <b>" + ref.getComDate().toString() + "</b>";
	}
	
	@Override
	public String getContent(){
		return "<b>Komentarz do zadania:</b><br />" + ref.getComComment();
	}
	
	@Override
	public Date getCreateDate(){
		return ref.getComDate();
	}
	
}
