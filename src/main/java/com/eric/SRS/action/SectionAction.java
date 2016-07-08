package com.eric.SRS.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eric.SRS.model.Section;
import com.eric.SRS.model.TranscriptEntry;
import com.eric.SRS.service.SectionService;
import com.eric.SRS.service.TranscriptEntryService;

/**
 * @author Ericwst
 *
 */
public class SectionAction extends SuperAction<Section> {
	private static final long serialVersionUID = 1L;
	private SectionService sectionService;
	private TranscriptEntryService transcriptEntryService;
	private String ids;
	private Map<String, Object> jsonMap = new HashMap<>();
	private Section section;
	
	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	
	
	public void setSectionService(SectionService sectionService) {
		this.sectionService = sectionService;
	}

	public void setTranscriptEntryService(TranscriptEntryService transcriptEntryService) {
		this.transcriptEntryService = transcriptEntryService;
	}

	public SectionService getSectionService() {
		return sectionService;
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


	public String query() {
		List<Section> sections = sectionService.getAllSections();
		jsonMap.put("rows", sections);
		jsonMap.put("total", sections.size());
		return "query";
	}

	public String oldSection() {
		List<Section> sections = sectionService.getAllSections();
		System.out.println("=============================" + sections);
		jsonMap.put("rows", sections);
		jsonMap.put("total", sections.size());
		System.out.println("==============================================" + sections);
		return "oldSection";
	}

	public String delete() {
		System.out.println(ids);
		for (int i = 0; i < ids.split(",").length; i++) {
			sectionService.deleteSection(Integer.parseInt(ids.split(",")[i]));
		}
		jsonMap.put("message", true);
		return "delete";
	}

	public String save() {
		sectionService.addSection(section);
		System.out.println(section);
		jsonMap.put("message", true);
		return "delete";
	}

	public String update() {
		sectionService.updateSection(section);
		System.out.println(section);
		jsonMap.put("mamege", true);
		return "update";
	}

	public String studentTranscript() {
		List<TranscriptEntry> transcriptEntries = transcriptEntryService.getBySection(section);
		System.out.println(section);
		jsonMap.put("rows", transcriptEntries);
		jsonMap.put("total", transcriptEntries.size());
		return "studentTranscript";
	}

}