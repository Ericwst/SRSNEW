package com.eric.SRS.daoTest;

import org.junit.BeforeClass;
import org.junit.Test;

import com.eric.SRS.dao.SectionDao;
import com.eric.SRS.factoryTest.DaoFactory;
import com.eric.SRS.model.Section;

/**
 * @author Ericwst
 *
 */
public class SectionDaoImplTest {
	private static SectionDao sectionDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		sectionDao = DaoFactory.getSectionDaoInstance();
	}

	@Test
	public void testSave() {

	}

	@Test
	public void testGetById() {
		System.out.println(sectionDao.getBySectionNo(16));
	}

	@Test
	public void testFindAll() {
		System.out.println(sectionDao.findAll(Section.class));
	}

}
