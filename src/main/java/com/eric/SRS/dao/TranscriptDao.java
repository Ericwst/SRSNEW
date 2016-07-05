package com.eric.SRS.dao;

import com.eric.SRS.model.Transcript;

public interface TranscriptDao extends BaseDao<Transcript> {
	public Transcript getByTranscriptId(int transcriptId);
}
