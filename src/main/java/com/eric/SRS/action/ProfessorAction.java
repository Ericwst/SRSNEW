package com.eric.SRS.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eric.SRS.model.Professor;
import com.eric.SRS.service.ProfessorService;
import com.opensymphony.xwork2.ActionSupport;

public class ProfessorAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private Map<String, Object> jsonMap = new HashMap<>();
	private List<Professor> professors = new ArrayList<>();
	private Professor professor;
	private ProfessorService professorService;
	private String ids;

	public void setProfessorService(ProfessorService professorService) {
		this.professorService = professorService;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getIds() {
		return ids;
	}

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public void setProfessors(List<Professor> professors) {
		this.professors = professors;
	}

	public List<Professor> getProfessors() {
		return professors;
	}

	public String query() {
		List<Professor> professors = professorService.getAllProfessors();
		jsonMap.put("rows", professors);
		jsonMap.put("total", professors.size());
		return "query";
	}

	public String queryList() {
		// List<Professor> professors=professorService.findAll();
		professors.addAll(professorService.getAllProfessors());
		// jsonMap.put("rows", professors);
		return "queryList";
	}

	public String delete() {
		System.out.println(ids);
		for (int i = 0; i < ids.split(",").length; i++) {
			professorService.deleteProfessor(Integer.parseInt(ids.split(",")[i]));
		}
		jsonMap.put("message", true);
		return "delete";
	}

	public String save() {
		professorService.addProfessor(professor);
		jsonMap.put("message", true);
		return "save";
	}

	public String update() {
		professorService.updateProfessor(professor);
		jsonMap.put("message", true);
		return "update";
	}

}