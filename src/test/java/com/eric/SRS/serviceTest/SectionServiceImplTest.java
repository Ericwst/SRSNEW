package com.eric.SRS.serviceTest;

import org.junit.BeforeClass;
import org.junit.Test;

import com.eric.SRS.dao.CourseDao;
import com.eric.SRS.dao.ProfessorDao;
import com.eric.SRS.dao.SectionDao;
import com.eric.SRS.factoryTest.DaoFactory;
import com.eric.SRS.factoryTest.ServiceFactory;
import com.eric.SRS.model.Course;
import com.eric.SRS.model.Professor;
import com.eric.SRS.model.Section;
import com.eric.SRS.model.Student;
import com.eric.SRS.service.SectionService;
import com.eric.SRS.service.StudentService;



/**
 * @author Ericwst
 *
 */
public class SectionServiceImplTest {
	private static SectionService sectionService;
	private static CourseDao courseDao;
	private static ProfessorDao professorDao;
	private static SectionDao sectionDao;
	private static StudentService studentService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		sectionService=ServiceFactory.getSectionServiceInstance();
		courseDao=DaoFactory.getCourseDaoInstance();
		professorDao=DaoFactory.getProfessorDaoInstance();
		sectionDao=DaoFactory.getSectionDaoInstance();
		studentService=ServiceFactory.getStudentServiceInstance();
	}
	@Test
	public void testSave() {
		Course c1, c2, c3, c4, c5;
		Professor p1, p2, p3;
		c1=courseDao.getByCourseId(7);
		c2=courseDao.getByCourseId(8);
		c3=courseDao.getByCourseId(9);
		c4=courseDao.getByCourseId(10);
		c5=courseDao.getByCourseId(11);
		p1=professorDao.getByPersonId(4);
		p2=professorDao.getByPersonId(5);
		p3=professorDao.getByPersonId(6);
		
		Section sec1, sec2, sec3, sec4, sec5, sec6, sec7;
		sec1 = c1.scheduleSection('M', "8:10 - 10:00 PM", "GOVT101", 30);

		sec2 = c1.scheduleSection('W', "6:10 - 8:00 PM", "GOVT202", 30);

		sec3 = c2.scheduleSection('R', "4:10 - 6:00 PM", "GOVT105", 25);

		sec4 = c2.scheduleSection('T', "6:10 - 8:00 PM", "SCI330", 25);

		sec5 = c3.scheduleSection('M', "6:10 - 8:00 PM", "GOVT101", 20);

		sec6 = c4.scheduleSection('R', "4:10 - 6:00 PM", "SCI241", 15);
		
		sec7 = c5.scheduleSection('M', "4:10 - 6:00 PM", "ARTS25", 40);
		
		p3.agreeToTeach(sec1);
		p2.agreeToTeach(sec2);
		p1.agreeToTeach(sec3);
		p3.agreeToTeach(sec4);
		p1.agreeToTeach(sec5);
		p2.agreeToTeach(sec6);
		p3.agreeToTeach(sec7);

		sectionService.addSection(sec1);
		sectionService.addSection(sec2);
		sectionService.addSection(sec3);
		sectionService.addSection(sec4);
		sectionService.addSection(sec5);
		sectionService.addSection(sec6);
		sectionService.addSection(sec7);
		
	}

	@Test
	public void testGetById() {
		System.out.println(sectionDao.getBySectionNo(25));
	}

	@Test
	public void testFindAll() {
		System.out.println(sectionDao.findAll(Section.class));
	}
	@Test
	public void testEnroll() {
		Student student=new Student();
		student.setId(3);
		Section section=new Section();
		section.setSectionNo(12);
		studentService.enroll(section, student);
		
	}

}
