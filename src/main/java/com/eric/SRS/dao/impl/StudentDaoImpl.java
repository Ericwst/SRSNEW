package com.eric.SRS.dao.impl;

import org.hibernate.Query;

import com.eric.SRS.dao.StudentDao;
import com.eric.SRS.model.Student;

public class StudentDaoImpl extends BaseDaoHibernate4<Student> implements StudentDao{

	public Student getByPersonId(int personId) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select s from Student s where id=:personId").setInteger("personId", personId);
		return (Student) query.uniqueResult();
	}
	

}
