package com.eric.SRS.action;

import java.util.HashMap;
import java.util.Map;

import com.eric.SRS.model.ScheduleOfClasses;
import com.eric.SRS.service.ScheduleOfClassesService;

public class ScheduleOfClassesAction extends SuperAction<ScheduleOfClasses> {

	private static final long serialVersionUID = 1L;
	private ScheduleOfClassesService scheduleOfClassesService;
	private Map<String, Object> jsonMap = new HashMap<>();

	public ScheduleOfClassesService getScheduleOfClassesService() {
		return scheduleOfClassesService;
	}

	public void setScheduleOfClassesService(ScheduleOfClassesService scheduleOfClassesService) {
		this.scheduleOfClassesService = scheduleOfClassesService;
	}

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

}
