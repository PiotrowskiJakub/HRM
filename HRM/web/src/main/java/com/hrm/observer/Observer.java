package com.hrm.observer;

import com.hrm.db.model.User;

public interface Observer {
	//TODO: arguments
	public void update(User user, ActionDone action);
}
