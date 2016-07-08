package com.eric.SRS.action;

import java.util.ArrayList;
import java.util.List;

import com.eric.SRS.model.Course;
import com.eric.SRS.service.CourseService;

public class CourseAction extends SuperAction<Course> {

	private static final long serialVersionUID = 1L;

	private CourseService courseService;
	private Class<Course> course;
	private List<Course> courses = new ArrayList<Course>();
	private int courseId;

	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public CourseService getCourseService() {
		return courseService;
	}


	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}


	public Class<Course> getCourse() {
		return course;
	}

	public void setCourse(Class<Course> course) {
		this.course = course;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setDepartments(List<Course> courses) {
		this.courses = courses;
	}

	public int getId() {
		return courseId;
	}

	public void setId(int id) {
		this.courseId = id;
	}

	public String delete() {
		courseService.deleteCourse(courseId);
		return SUCCESS;
	}

	public String show() {
		courses = courseService.getAllCourses();
		return SUCCESS;
	}

}
