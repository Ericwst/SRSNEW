package com.eric.SRS.dao;

import com.eric.SRS.model.Course;

public interface CourseDao extends BaseDao<Course> {
	
	public Course getByCourseId(int courseId);
}
