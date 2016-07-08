package com.eric.SRS.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.eric.SRS.dao.SectionDao;
import com.eric.SRS.dao.StudentDao;
import com.eric.SRS.dao.TranscriptEntryDao;
import com.eric.SRS.enumeration.EnrollmentStatus;
import com.eric.SRS.model.Person;
import com.eric.SRS.model.Section;
import com.eric.SRS.model.Student;
import com.eric.SRS.model.Transcript;
import com.eric.SRS.model.TranscriptEntry;
import com.eric.SRS.service.StudentService;

public class StudentServiceImpl implements StudentService {

	private StudentDao studentDao;
	private SectionDao sectionDao;
	private TranscriptEntryDao transcriptEntryDao;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public StudentDao getStudentDao() {
		return studentDao;
	}

	public SectionDao getSectionDao() {
		return sectionDao;
	}

	public void setSectionDao(SectionDao sectionDao) {
		this.sectionDao = sectionDao;
	}

	public TranscriptEntryDao getTranscriptEntryDao() {
		return transcriptEntryDao;
	}

	public void setTranscriptEntryDao(TranscriptEntryDao transcriptEntryDao) {
		this.transcriptEntryDao = transcriptEntryDao;
	}

	@Override
	public int addStudent(Student student) {
		// TODO Auto-generated method stub
		return (Integer) studentDao.save(student);
	}

	@Override
	public List<Student> getAllStudents() {
		return studentDao.findAll(Student.class);
	}

	@Override
	public void deleteStudent(int id) {
		studentDao.delete(Student.class, id);
	}



	public EnrollmentStatus enroll(Section section, Student student) {
		Transcript transcript = new Transcript();
		transcript.setTranscriptEntries(transcriptEntryDao.getBySection(section));
		student = studentDao.getByPersonId(student.getId());
		section = sectionDao.getBySectionNo(section.getSectionNo());
		List<Student> students = new ArrayList<>();
		List<TranscriptEntry> transcriptEntries = transcriptEntryDao.getBySection(section);
		Map<String, Student> enrollStudents = new HashMap<>();
		for (Iterator<TranscriptEntry> iterator = transcriptEntries.iterator(); iterator.hasNext();) {
			TranscriptEntry transcriptEntry = (TranscriptEntry) iterator.next();
			students.add(transcriptEntry.getStudent());
		}
		for (Iterator<Student> iterator = students.iterator(); iterator.hasNext();) {
			Student student2 = (Student) iterator.next();
			enrollStudents.put(student2.getSsn(), student2);
		}

		section.setEnrolledStudents(enrollStudents);
		EnrollmentStatus enrollmentStatus = section.enroll(student);
		if (enrollmentStatus.equals(EnrollmentStatus.success)) {
			TranscriptEntry transcriptEntry = new TranscriptEntry();
			transcriptEntry.setStudent(student);
			transcriptEntry.setSection(section);
			transcriptEntryDao.save(transcriptEntry);
		}
		return enrollmentStatus;
	}


}
