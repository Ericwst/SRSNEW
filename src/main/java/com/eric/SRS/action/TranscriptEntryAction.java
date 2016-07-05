package com.eric.SRS.action;

import java.util.HashMap;
import java.util.Map;

import com.eric.SRS.service.TranscriptEntryService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Ericwst
 *
 */
public class TranscriptEntryAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private TranscriptEntryService transcriptEntryService;
	private Map<String, Object> jsonMap = new HashMap<>();

	public void setTranscriptEntryService(TranscriptEntryService transcriptEntryService) {
		this.transcriptEntryService = transcriptEntryService;
	}

	public TranscriptEntryService getTranscriptEntryService() {
		return transcriptEntryService;
	}

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}
}
