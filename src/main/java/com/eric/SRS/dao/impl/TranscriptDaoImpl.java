package com.eric.SRS.dao.impl;

import org.hibernate.Query;

import com.eric.SRS.dao.TranscriptDao;
import com.eric.SRS.model.Transcript;

public class TranscriptDaoImpl extends BaseDaoHibernate4<Transcript> implements TranscriptDao {

	public Transcript getByTranscriptId(int transcriptId) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select t from Transcript t where transcriptId=:transcriptId")
				.setInteger("transcriptId", transcriptId);
		return (Transcript) query.uniqueResult();
	}


}
