package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.Course;

public interface CourseService
{
	
	int addCourse(Course course);

	List<Course> getAllCourses();
	
	void deleteCourse(int courseId);
	
	Course getByCourseId(int courseId);
}
 