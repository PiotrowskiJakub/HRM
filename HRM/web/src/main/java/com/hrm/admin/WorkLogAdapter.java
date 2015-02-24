package com.hrm.admin;

import java.util.Date;

import com.hrm.db.model.WorkLog;

public class WorkLogAdapter implements UserRegistration {
	private WorkLog ref;
	
	public WorkLogAdapter(WorkLog ref){
		this.ref = ref;
	}
	
	@Override
	public String getRegistrationTitle() {
		return "Nazwa projektu: <b>" + ref.getTask().getProject().getPrjName() + "</b><br />Nazwa zadania: <b>" + ref.getTask().getNazwa() + "</b><br /> Data wpisu: <b>" + ref.getWloDate().toString() + "</b><br />Czas pracy: <b>" + UserManagement.getTimeOutput(ref.getWloTime()) +"</b>";
		
	}

	@Override
	public String getContent(){
		return "<b>Wykonana praca:</b><br />" + ref.getWloComment();
	}
	
	@Override
	public Date getCreateDate(){
		return ref.getWloDate();
	}
	
}
