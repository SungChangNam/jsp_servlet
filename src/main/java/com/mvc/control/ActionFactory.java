package com.mvc.control;

import com.mvc.action.Action;
import com.mvc.action.IndexAction;

/*
 *  ActionFactory
 *   - 사용자의 요청을 처리할 비즈니스 로직 구현돈 
 *   		XXXAction 객체의 생성을 담당한다.
 * 
 * */

public class ActionFactory {
		
	private  static ActionFactory factory;
	
	
	private ActionFactory() { }

	
	public static synchronized ActionFactory getInstance() {
		if (factory== null) {
			factory = new ActionFactory();
		}
		return factory;
	}

	public Action getAction(String cmd) {
		Action action =null;
		if (cmd.equals("index")) {
			action =new IndexAction();
		}
		return  action;
	}
	
	
}
