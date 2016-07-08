package com.eric.SRS.service.impl;

import java.util.List;

import com.eric.SRS.dao.ScheduleOfClassesDao;
import com.eric.SRS.model.ScheduleOfClasses;
import com.eric.SRS.service.ScheduleOfClassesService;

public class ScheduleOfClassesServiceImpl implements ScheduleOfClassesService {

	private ScheduleOfClassesDao scheduleOfClassesDao;


	public void setScheduleOfClassesDao(ScheduleOfClassesDao ScheduleOfClassesDao) {
		this.scheduleOfClassesDao = ScheduleOfClassesDao;
	}

	@Override
	public int addScheduleOfClasses(ScheduleOfClasses scheduleOfClasses) {
		// TODO Auto-generated method stub
		return (Integer) scheduleOfClassesDao.save(scheduleOfClasses);
	}

	@Override
	public List<ScheduleOfClasses> getAllScheduleOfClasses() {
		// TODO Auto-generated method stub
		return scheduleOfClassesDao.findAll(ScheduleOfClasses.class);
	}

	@Override
	public void deleteScheduleOfClasses(int scheduleOfClassesId) {
		// TODO Auto-generated method stub
		scheduleOfClassesDao.delete(ScheduleOfClasses.class, scheduleOfClassesId);
	}

}
