package com.eric.SRS.dao;

import com.eric.SRS.model.Student;

public interface StudentDao extends BaseDao<Student> {
	public Student getByPersonId(int personId);

}
