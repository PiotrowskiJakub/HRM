package com.hrm.singleton;

import com.hrm.observer.ObserverManager;
import com.hrm.observer.ObserverManagerImp;

public class Singelton {
	private static ObserverManager observerManager;
	private Singelton(){
		
	}
	
	public static ObserverManager getInstance(){
		if(observerManager == null)
			observerManager = new ObserverManagerImp();
		
		return observerManager;
	}
	
	
}
