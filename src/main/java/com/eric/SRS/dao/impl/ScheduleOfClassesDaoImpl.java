package com.eric.SRS.dao.impl;

import org.hibernate.Query;

import com.eric.SRS.dao.ScheduleOfClassesDao;
import com.eric.SRS.model.ScheduleOfClasses;

public class ScheduleOfClassesDaoImpl extends BaseDaoHibernate4<ScheduleOfClasses> implements ScheduleOfClassesDao {
	
	public ScheduleOfClasses getByScheduleOfClassesId(int scheduleOfClassesId) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select s from ScheduleOfClasses s where scheduleOfClassesId=:scheduleOfClassesId").setInteger("scheduleOfClassesId", scheduleOfClassesId);
		return (ScheduleOfClasses) query.uniqueResult();
	}

	@Override
	public ScheduleOfClasses getScheduleOfClass(String semester) {
		// TODO Auto-generated method stub
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select s from ScheduleOfClasses s where semester=:semester").setString("semester", semester);
		return (ScheduleOfClasses) query.uniqueResult();
	}
	
}
