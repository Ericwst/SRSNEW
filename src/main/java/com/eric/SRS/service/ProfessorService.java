package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.Professor;

public interface ProfessorService {

	int addProfessor(Professor professor);

	void deleteProfessor(int id);

	List<Professor> getAllProfessors();

	void updateProfessor(Professor professor);
}
