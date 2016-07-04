package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.Transcript;

public interface TranscriptService {

	int addTranscript(Transcript transcript);

	List<Transcript> getAllTranscripts();

	void deleteTranscript(int transcriptId);
}
