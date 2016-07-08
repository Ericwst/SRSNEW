package com.eric.SRS.action;

import com.eric.SRS.model.TranscriptEntry;
import com.eric.SRS.service.TranscriptEntryService;

/**
 * @author Ericwst
 *
 */
public class TranscriptEntryAction extends SuperAction<TranscriptEntry> {

	private static final long serialVersionUID = 1L;
	private TranscriptEntryService transcriptEntryService;

	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	public void setTranscriptEntryService(TranscriptEntryService transcriptEntryService) {
		this.transcriptEntryService = transcriptEntryService;
	}

	public TranscriptEntryService getTranscriptEntryService() {
		return transcriptEntryService;
	}

}
