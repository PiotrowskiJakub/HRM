package com.hrm.observer;


import com.hrm.db.model.User;
import com.hrm.user.EmployeeManager;

public class ObserverUser implements Observer{
	private User user;
	private User userWhoViewed;
	private ActionDone action;
	private ObserverManager observerManager;
	private EmployeeManager employeeManager;
		
	public ObserverUser(ObserverManager observerManager, User userWhoViewed){
		this.userWhoViewed = userWhoViewed;
		this.observerManager = observerManager;
		observerManager.registerObserver(this);
				
	}

	@Override
	public void update(User user, ActionDone action) {
		this.user = user;
		this.action = action;
		employeeManager = new EmployeeManager(user.getUsrLogin());
		employeeManager.addLog(action, user, userWhoViewed);
		show();	
	}
	
	public void show(){
		System.out.println(user.getUsrName() + "__ " + user.getUsrSurname() + action.toString());
		
	}

	
}
