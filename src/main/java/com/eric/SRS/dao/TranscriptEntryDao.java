package com.eric.SRS.dao;

import java.util.List;

import com.eric.SRS.model.Section;
import com.eric.SRS.model.Student;
import com.eric.SRS.model.TranscriptEntry;

public interface TranscriptEntryDao extends BaseDao<TranscriptEntry> {

	public TranscriptEntry getByTranscriptEntryId(int transcriptEntryId);

	public List<TranscriptEntry> getBySection(Section section);
	
	public List<TranscriptEntry> getByStudent(Student student);
}
