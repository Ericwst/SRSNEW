package com.eric.SRS.service.impl;

import java.util.List;

import com.eric.SRS.dao.TranscriptEntryDao;
import com.eric.SRS.model.TranscriptEntry;
import com.eric.SRS.service.TranscriptEntryService;

public class TranscriptEntryServiceImpl implements TranscriptEntryService {
	
	private TranscriptEntryDao transcriptEntryDao;
	
	public void setTranscriptEntryDao(TranscriptEntryDao transcriptEntryDao) {
		this.transcriptEntryDao = transcriptEntryDao;
	}

	@Override
	public int addTranscriptEntry(TranscriptEntry transcriptEntry) {
		// TODO Auto-generated method stub
		return (Integer) transcriptEntryDao.save(transcriptEntry);
	}

	@Override
	public List<TranscriptEntry> getAllTranscriptEntrys() {
		// TODO Auto-generated method stub
		return transcriptEntryDao.findAll(TranscriptEntry.class);
	}

	@Override
	public void deleteTranscriptEntry(int transcriptEntryId) {
		// TODO Auto-generated method stub
		transcriptEntryDao.delete(TranscriptEntry.class, transcriptEntryId);;
	}


}
