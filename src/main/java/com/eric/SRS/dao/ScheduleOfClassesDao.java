package com.eric.SRS.dao;

import com.eric.SRS.model.ScheduleOfClasses;

public interface ScheduleOfClassesDao extends BaseDao<ScheduleOfClasses> {

	public ScheduleOfClasses getByScheduleOfClassesId(int scheduleOfClassesId);
	public ScheduleOfClasses getScheduleOfClass(String semester);
}
