package com.eric.SRS.dao.impl;

import org.hibernate.Query;

import com.eric.SRS.dao.CourseCatalogDao;
import com.eric.SRS.model.CourseCatalog;

public class CourseCatalogDaoImpl extends BaseDaoHibernate4<CourseCatalog> implements CourseCatalogDao {

	public CourseCatalog getByCourseCatalogId(int courseCatalogId) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select p from CourseCatalog p where courseCatalogId=:courseCatalogId")
				.setInteger("courseCatalogId", courseCatalogId);
		return (CourseCatalog) query.uniqueResult();
	}
}
