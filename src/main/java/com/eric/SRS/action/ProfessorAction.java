package com.eric.SRS.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eric.SRS.model.Professor;
import com.eric.SRS.service.ProfessorService;

public class ProfessorAction extends SuperAction<Professor> {
	
	private static final long serialVersionUID = 1L;
	private List<Professor> professors = new ArrayList<>();
	private Professor professor;
	private ProfessorService professorService;
	private int id;

	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	
	public void setProfessorService(ProfessorService professorService) {
		this.professorService = professorService;
	}


	public void setProfessors(List<Professor> professors) {
		this.professors = professors;
	}

	public List<Professor> getProfessors() {
		return professors;
	}

	public List<Professor> query() {
		List<Professor> professors = professorService.getAllProfessors();
		return professors;
	}

	public String queryList() {
		professors.addAll(professorService.getAllProfessors());
		return "queryList";
	}

	public String delete() {
			professorService.deleteProfessor(id);
		return "delete";
	}

	public String save() {
		professorService.addProfessor(professor);
		return "save";
	}

	public String update() {
		professorService.updateProfessor(professor);
		return "update";
	}

}