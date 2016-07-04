package com.eric.SRS.dao;

import com.eric.SRS.model.Professor;

public interface ProfessorDao extends BaseDao<Professor> {
	public Professor getByPersonId(int personId);
}
