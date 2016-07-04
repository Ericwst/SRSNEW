package com.eric.SRS.dao.impl;

import org.hibernate.Query;

import com.eric.SRS.dao.ProfessorDao;
import com.eric.SRS.model.Professor;

public class ProfessorDaoImpl extends BaseDaoHibernate4<Professor> implements ProfessorDao {

	public Professor getByPersonId(int personId) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select p from Professor p where id=:personId").setInteger("personId", personId);
		return (Professor) query.uniqueResult();
	}

}
