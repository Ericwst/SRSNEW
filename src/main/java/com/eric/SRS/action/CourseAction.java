package com.eric.SRS.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eric.SRS.model.Course;
import com.eric.SRS.service.CourseService;
import com.opensymphony.xwork2.ActionSupport;

public class CourseAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private CourseService courseService;
	private String ids;
	private Map<String, Object> jsonMap = new HashMap<>();
	private Class<Course> course;
	private List<Course> courses = new ArrayList<Course>();
	private int courseId;
	private long total;// 总记录数
	private Integer rows;// 每页显示的记录数
	private Integer page;// 当前页数

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

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getIds() {
		return ids;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public String query() {
		courses = courseService.getAllCourses();
		System.out.println(total);
		jsonMap.put("rows", courses);
		jsonMap.put("total", courses);
		return "query";
	}

	public String queryList() {
		courses = courseService.getAllCourses();
		return "queryList";
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
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
