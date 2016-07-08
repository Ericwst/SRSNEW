package com.eric.SRS.daoTest;

import org.junit.BeforeClass;
import org.junit.Test;

import com.eric.SRS.dao.StudentDao;
import com.eric.SRS.factoryTest.DaoFactory;
import com.eric.SRS.model.Student;

/**
 * @author Ericwst
 *
 */
public class StudentDaoImplTest {
	private static StudentDao studentDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		studentDao = DaoFactory.getStudentDaoInstance();
	}

	@Test
	public void testSave() {
		Student s1, s2, s3;
		s1 = new Student("Joe Blow", "111-11-1111", "123", "Math", "M.S.");

		s2 = new Student("Fred Schnurd", "222-22-2222", "123", "Information Technology", "Ph. D.");

		s3 = new Student("Mary Smith", "333-33-3333", "123", "Physics", "B.S.");
		studentDao.save(s1);
		studentDao.save(s2);
		studentDao.save(s3);
	}

	@Test
	public void testGetById() {
		System.out.println(studentDao.getByPersonId(8));
	}

	@Test
	public void testFindAll() {
		System.out.println(studentDao.findAll(Student.class));
	}

}
