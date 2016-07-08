package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.enumeration.EnrollmentStatus;
import com.eric.SRS.model.Section;
import com.eric.SRS.model.Student;

public interface StudentService {

	int addStudent(Student student);

	List<Student> getAllStudents();

	public EnrollmentStatus enroll(Section section, Student student);

	void deleteStudent(int id);

}
