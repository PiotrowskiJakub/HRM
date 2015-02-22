package com.hrm.observer;

import java.util.LinkedList;

import com.hrm.db.model.User;

public class ObserverManagerImp implements ObserverManager{
	private LinkedList<Observer> observers; 

	private User user;
	private ActionDone action;
	
	public ObserverManagerImp() {
		observers = new LinkedList<Observer>();
	}

	@Override
	public void registerObserver(Observer observer) {
		observers.add(observer);
	}

	@Override
	public void unregisterObserver(Observer observer) {
		observers.remove(observer);
	}

	@Override
	public void notifyObservers() {
		for(Observer observer : observers)
			observer.update(user,action);
		
	}
	
	public void dataChanged(User user, ActionDone action){
		this.user= user; 
		this.action = action;
		notifyObservers();
	}
}
