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
	private int sectionId;
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



	public List<Section> query() {
		List<Section> sections = sectionService.getAllSections();
		return sections;
	}


	public String delete() {
			sectionService.deleteSection(sectionId);
		return "delete";
	}

	public String save() {
		sectionService.addSection(section);
		jsonMap.put("message", true);
		return "delete";
	}

	public String update() {
		sectionService.updateSection(section);
		jsonMap.put("mamege", true);
		return "update";
	}

	public List<TranscriptEntry> studentTranscript() {
		List<TranscriptEntry> transcriptEntries = transcriptEntryService.getBySection(section);
		return transcriptEntries;
	}

}