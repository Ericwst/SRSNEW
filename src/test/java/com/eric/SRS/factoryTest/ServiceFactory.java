package com.eric.SRS.factoryTest;

import com.eric.SRS.modelTest.BaseClass;
import com.eric.SRS.service.SectionService;
import com.eric.SRS.service.StudentService;

public class ServiceFactory {
	public static StudentService getStudentServiceInstance(){
		return (StudentService) BaseClass.LoadXML().getBean("studentService");
	}
	public static SectionService getSectionServiceInstance(){
		return (SectionService) BaseClass.LoadXML().getBean("sectionService");
	}
}
