package com.eric.SRS.service.impl;

import java.util.List;

import com.eric.SRS.dao.TranscriptDao;
import com.eric.SRS.model.Transcript;
import com.eric.SRS.service.TranscriptService;

public class TranscriptServiceImpl implements TranscriptService {
	
	private TranscriptDao transcriptDao;
	
	public void setTranscriptDao(TranscriptDao transcriptDao) {
		this.transcriptDao = transcriptDao;
	}

	@Override
	public int addTranscript(Transcript transcript) {
		// TODO Auto-generated method stub
		return (Integer) transcriptDao.save(transcript);
	}

	@Override
	public List<Transcript> getAllTranscripts() {
		// TODO Auto-generated method stub
		return transcriptDao.findAll(Transcript.class);
	}

	@Override
	public void deleteTranscript(int transcriptId) {
		// TODO Auto-generated method stub
		transcriptDao.delete(Transcript.class, transcriptId);;
	}


}
