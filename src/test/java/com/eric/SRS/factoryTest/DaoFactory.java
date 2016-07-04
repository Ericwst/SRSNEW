package com.eric.SRS.factoryTest;

import com.eric.SRS.dao.CourseDao;
import com.eric.SRS.dao.ProfessorDao;
import com.eric.SRS.dao.SectionDao;
import com.eric.SRS.dao.StudentDao;
import com.eric.SRS.modelTest.BaseClass;

public class DaoFactory {
	public static StudentDao getStudentDaoInstance(){
		return (StudentDao) BaseClass.LoadXML().getBean("studentDao");
	}
	public static ProfessorDao getProfessorDaoInstance(){
		return (ProfessorDao) BaseClass.LoadXML().getBean("professorDao");
	}
	public static SectionDao getSectionDaoInstance(){
		return (SectionDao) BaseClass.LoadXML().getBean("sectionDao");
	}
	public static CourseDao getCourseDaoInstance(){
		return (CourseDao) BaseClass.LoadXML().getBean("courseDao");
	}
	
}
