package com.eric.SRS.dao.impl;

import java.util.HashMap;

import org.hibernate.Query;

import com.eric.SRS.dao.SectionDao;
import com.eric.SRS.model.Section;

public class SectionDaoImpl extends BaseDaoHibernate4<Section> implements SectionDao {

	public Section getBySectionNo(int sectionNo) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select s from Section s where sectionNo=:sectionNo").setInteger("sectionNo", sectionNo);
		return (Section) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Section> getBySemester(String semester) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select s from Section s where semester=:semester").setString("semester", semester);
		return  (HashMap<String, Section>)query.uniqueResult();
	}
	
	

}
