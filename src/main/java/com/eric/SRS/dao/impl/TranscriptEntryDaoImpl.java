package com.eric.SRS.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.eric.SRS.dao.TranscriptEntryDao;
import com.eric.SRS.model.Section;
import com.eric.SRS.model.Student;
import com.eric.SRS.model.TranscriptEntry;

public class TranscriptEntryDaoImpl extends BaseDaoHibernate4<TranscriptEntry> implements TranscriptEntryDao {

	@Override
	public List<TranscriptEntry> getBySection(Section section) {
		return find(" from  TranscriptEntry where section_id=" + section.getSectionNo());
	}

	public TranscriptEntry getByTranscriptEntryId(int transcriptEntryId) {
		Query query = getSessionFactory().getCurrentSession()
				.createQuery("select t from TranscriptEntry t where transcriptEntryId=:transcriptEntryId")
				.setInteger("transcriptEntryId", transcriptEntryId);
		return (TranscriptEntry) query.uniqueResult();
	}
	
	@Override
	public List<TranscriptEntry> getByStudent(Student student) {
		return find(" from  TranscriptEntry where student_id= "+student.getId());
	}
}
