package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.ScheduleOfClasses;

public interface ScheduleOfClassesService {

	int addScheduleOfClasses(ScheduleOfClasses scheduleOfClasses);

	List<ScheduleOfClasses> getAllScheduleOfClasses();

	void deleteScheduleOfClasses(int scheduleOfClassesId);
}
