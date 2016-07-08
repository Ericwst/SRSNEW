package com.eric.SRS.daoTest;

import org.junit.BeforeClass;
import org.junit.Test;

import com.eric.SRS.dao.ProfessorDao;
import com.eric.SRS.factoryTest.DaoFactory;
import com.eric.SRS.model.Professor;

/**
 * @author Ericwst
 *
 */
public class ProfessorDaoImplTest {
	private static ProfessorDao professorDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		professorDao = DaoFactory.getProfessorDaoInstance();
	}

	@Test
	public void testGetById() {
		System.out.println(professorDao.getByPersonId(16));
	}

	@Test
	public void testSave() {
		Professor p1, p2, p3;
		p1 = new Professor("Jacquie Barker", "123-45-6789", "123", "Adjunct Professor", "Information Technology");

		p2 = new Professor("John Smith", "567-81-2345", "123", "Full Professor", "Chemistry");

		p3 = new Professor("Snidely Whiplash", "987-65-4321", "123", "Full Professor", "Physical Education");
		professorDao.save(p1);
		professorDao.save(p2);
		professorDao.save(p3);

	}

	@Test
	public void testFindAll() {
		System.out.println(professorDao.findAll(Professor.class));
	}

}
