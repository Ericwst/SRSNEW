package com.eric.SRS.daoTest;

import java.util.HashMap;

import org.junit.BeforeClass;
import org.junit.Test;

import com.eric.SRS.dao.CourseDao;
import com.eric.SRS.factoryTest.DaoFactory;
import com.eric.SRS.model.Course;

/**
 * @author Ericwst
 *
 */
public class CourseDaoImplTest {
	private static CourseDao courseDao;
	HashMap<String, Course> courses = new HashMap<String, Course>();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		courseDao = DaoFactory.getCourseDaoInstance();
	}

	@Test
	public void testSave() {
		Course c1, c2, c3, c4, c5;
		c1 = new Course("CMP101", "Beginning Computer Technology", 3.0);

		c2 = new Course("OBJ101", "Object Methods for Software Development", 3.0);

		c3 = new Course("CMP283", "Higher Level Languages (Java)", 3.0);

		c4 = new Course("CMP999", "Living Brain Computers", 3.0);

		c5 = new Course("ART101", "Beginning Basketweaving", 3.0);
		courseDao.save(c1);
		courseDao.save(c2);
		courseDao.save(c3);
		courseDao.save(c4);
		courseDao.save(c5);
		// Establish some prerequisites (c1 => c2 => c3 => c4).
/*		c2.addPrerequisite(c1);
		c3.addPrerequisite(c2);
		c4.addPrerequisite(c3);
		courses.put(c1.getCourseNo(), c1);
		courses.put(c2.getCourseNo(), c2);
		courses.put(c3.getCourseNo(), c3);
		courses.put(c4.getCourseNo(), c4);
		courses.put(c5.getCourseNo(), c5);

		for (Course course : courses) {
			courseDao.update(course);
		}*/
	}

	@Test
	public void testGetByCourseId() {
		System.out.println(courseDao.getByCourseId(1));
	}

	@Test
	public void testFindAll() {
		System.out.println(courseDao.findAll(Course.class));
	}

}
