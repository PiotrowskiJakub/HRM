package com.hrm.observer;

import com.hrm.db.model.User;

public interface ObserverManager {
	public void registerObserver(Observer observer);
	public void unregisterObserver(Observer observer);
	public void notifyObservers();
	public void dataChanged(User user, ActionDone action);
}
