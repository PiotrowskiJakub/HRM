package com.hrm.observer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.hrm.db.model.User;

public class ObserverUser implements Observer{
	private User user;
	private ActionDone action;
	private ObserverManager observerManager; 
	private JspWriter writer;
	
	public ObserverUser(ObserverManager observerManager, JspWriter writer){
		this.observerManager = observerManager;
		observerManager.registerObserver(this);
		this.writer = writer;
		try {
			writer.write("ObserverUser working");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void update(User user, ActionDone action) {
		this.user = user;
		this.action = action;
		try {
			writer.write("Siema");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		show();
		
		
	}
	
	public void show(){
		//System.out.println(user.getUsrName() + "__ " + user.getUsrSurname() + action.toString());
		try {
			
			writer.write("siema");
		} catch (IOException e) {
			System.out.println("bład");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
