package com.eric.SRS.service.impl;

import java.util.List;

import com.eric.SRS.dao.ProfessorDao;
import com.eric.SRS.model.Professor;
import com.eric.SRS.service.ProfessorService;

public class ProfessorServiceImpl implements ProfessorService {
	private ProfessorDao professorDao;
	public void setProfessorDao(ProfessorDao professorDao) {
		this.professorDao = professorDao;
	}

	@Override
	public int addProfessor(Professor professor) {
		// TODO Auto-generated method stub
		return (Integer)professorDao.save(professor);
	}

	@Override
	public void deleteProfessor(int id) {
		// TODO Auto-generated method stub
		professorDao.delete(Professor.class, id);
	}

	@Override
	public List<Professor> getAllProfessors() {
		// TODO Auto-generated method stub
		return professorDao.findAll(Professor.class);
	}

	@Override
	public void updateProfessor(Professor professor) {
		professorDao.update(professor);
		
	}
}
