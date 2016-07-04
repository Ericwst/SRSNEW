package com.eric.SRS.modelTest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BaseClass {
	public static ApplicationContext LoadXML(){
		return new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	
}
