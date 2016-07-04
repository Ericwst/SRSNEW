package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.TranscriptEntry;

public interface TranscriptEntryService {

	int addTranscriptEntry(TranscriptEntry transcriptEntry);

	List<TranscriptEntry> getAllTranscriptEntrys();

	void deleteTranscriptEntry(int transcriptEntryId);
}
