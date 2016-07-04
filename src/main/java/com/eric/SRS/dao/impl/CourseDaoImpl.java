package com.eric.SRS.dao.impl;

import org.hibernate.Query;

import com.eric.SRS.dao.CourseDao;
import com.eric.SRS.model.Course;

public class CourseDaoImpl extends BaseDaoHibernate4<Course> implements CourseDao {

	public Course getByCourseId(int courseId) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select p from Course p where courseId=:courseId").setInteger("courseId", courseId);
		return (Course) query.uniqueResult();
	}
}
