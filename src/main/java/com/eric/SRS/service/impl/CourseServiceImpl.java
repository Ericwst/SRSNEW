package com.eric.SRS.service.impl;

import java.util.List;

import com.eric.SRS.dao.CourseDao;
import com.eric.SRS.model.Course;
import com.eric.SRS.service.CourseService;

public class CourseServiceImpl implements CourseService
{
	private CourseDao courseDao;
	
	
	public void setCourseDao(CourseDao courseDao)
	{
		this.courseDao = courseDao;
	}

	@Override
	public int addCourse(Course course)
	{
		return (Integer) courseDao.save(course);
	}

	@Override
	public List<Course> getAllCourses()
	{
		return courseDao.findAll(Course.class);
	}

	@Override
	public void deleteCourse(int courseId)
	{
		courseDao.delete(Course.class, courseId);
	}

	@Override
	public Course getByCourseId(int courseId) {
		return courseDao.getByCourseId(courseId);
	}
}
