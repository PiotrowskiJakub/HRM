package com.hrm.observer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.hrm.db.model.User;

public class ObserverUser implements Observer{
	private User user;
	private ActionDone action;
	private ObserverManager observerManager; 
	private PageContext pageContext;
	private HttpServletResponse response;
	private HttpServletRequest request;
		
	public ObserverUser(ObserverManager observerManager, PageContext pageContext, HttpServletResponse response, HttpServletRequest request){
		this.observerManager = observerManager;
		observerManager.registerObserver(this);
		this.response = response;
		this.request = request;
		this.pageContext = pageContext;
				
	}

	@Override
	public void update(User user, ActionDone action) {
		
		this.user = user;
		this.action = action;
		show();
		String site = "userpanel.jsp?useri="+user.getUsrId() + "&action=" + action ;
		
		String redirect = 
			    response.encodeRedirectURL(request.getContextPath() + "/jsps/Uploadtest.jsp");
		
		
		
	}
	
	public void show(){
		System.out.println(user.getUsrName() + "__ " + user.getUsrSurname() + action.toString());
		
	}

	
}
