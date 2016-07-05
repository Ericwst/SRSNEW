package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.Section;
import com.eric.SRS.model.Student;
import com.eric.SRS.model.TranscriptEntry;

public interface TranscriptEntryService {

	int addTranscriptEntry(TranscriptEntry transcriptEntry);

	List<TranscriptEntry> getAllTranscriptEntrys();

	void deleteTranscriptEntry(int transcriptEntryId);

	List<TranscriptEntry> getBySection(Section section);

	void deleteSection(TranscriptEntry transcriptEntry);

	List<TranscriptEntry> getByStudent(Student student);

	 void deleteSection(int transcriptEntryId);

}
