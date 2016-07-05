package com.eric.SRS.service.impl;

import java.util.List;

import com.eric.SRS.dao.SectionDao;
import com.eric.SRS.model.Section;
import com.eric.SRS.service.SectionService;

public class SectionServiceImpl implements SectionService {
	private SectionDao sectionDao;
	
	public SectionDao getSectionDao() {
		return sectionDao;
	}

	public void setSectionDao(SectionDao sectionDao) {
		this.sectionDao = sectionDao;
	}

	@Override
	public int addSection(Section section) {
		// TODO Auto-generated method stub
		return (Integer) sectionDao.save(section);
	}

	@Override
	public List<Section> getAllSections() {
		// TODO Auto-generated method stub
		return sectionDao.findAll(Section.class);
	}

	@Override
	public void deleteSection(int sectionNo) {
		// TODO Auto-generated method stub
		sectionDao.delete(Section.class,sectionNo);

	}

	@Override
	public Section getBySectionNo(int sectionNo) {
		// TODO Auto-generated method stub
		return sectionDao.getBySectionNo(sectionNo);
	}

	@Override
	public void updateSection(Section section) {
		sectionDao.update(section);
	}

}
