package com.eric.SRS.model;
// Transcript.java - Chapter 14, Java 5 version.

// Copyright 2005 by Jacquie Barker - all rights reserved.

// A MODEL class.

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "transcript")
public class Transcript implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// ------------
	// Attributes.
	// ------------
	@Id
	@Column(name = "transcript_id")
	private int transcriptId;

	@OneToMany(targetEntity = TranscriptEntry.class, mappedBy = "transcript", cascade = CascadeType.ALL)
	private List<TranscriptEntry> transcriptEntries = new ArrayList<TranscriptEntry>();

	@OneToOne(targetEntity = Person.class)
	@JoinColumn(name = "person_id", referencedColumnName = "person_id", unique = true)
	private Student studentOwner;

	// ----------------
	// Constructor(s).
	// ----------------
	public Transcript() {
	}

	public Transcript(Student s) {
		setStudentOwner(s);

		// Note that we're instantiating empty support Collection(s).

		transcriptEntries = new ArrayList<TranscriptEntry>();
	}

	// ------------------
	// Accessor methods.
	// ------------------
	public int getTranscriptId() {
		return transcriptId;
	}

	public void setTranscriptId(int transcriptId) {
		this.transcriptId = transcriptId;
	}

	public void setStudentOwner(Student s) {
		studentOwner = s;
	}

	public Student getStudentOwner() {
		return studentOwner;
	}

	public List<TranscriptEntry> getTranscriptEntries() {
		return transcriptEntries;
	}

	public void setTranscriptEntries(List<TranscriptEntry> transcriptEntries) {
		this.transcriptEntries = transcriptEntries;
	}
	// -----------------------------
	// Miscellaneous other methods.
	// -----------------------------

	public boolean verifyCompletion(Course c) {
		boolean outcome = false;

		// Step through all TranscriptEntries, looking for one
		// which reflects a Section of the Course of interest.

		for (TranscriptEntry te : transcriptEntries) {
			Section s = te.getSection();

			if (s.isSectionOf(c)) {
				// Ensure that the grade was high enough.

				if (TranscriptEntry.passingGrade(te.getGrade())) {
					outcome = true;

					// We've found one, so we can afford to
					// terminate the loop now.

					break;
				}
			}
		}

		return outcome;
	}

	public void addTranscriptEntry(TranscriptEntry te) {
		transcriptEntries.add(te);
	}

	public void display() {
		System.out.println("Transcript for:  " + getStudentOwner().toString());

		if (transcriptEntries.size() == 0) {
			System.out.println("\t(no entries)");
		} else
			for (TranscriptEntry te : transcriptEntries) {
				Section sec = te.getSection();

				Course c = sec.getRepresentedCourse();

				ScheduleOfClasses soc = sec.getOfferedIn();

				System.out.println("\tSemester:        " + soc.getSemester());
				System.out.println("\tCourse No.:      " + c.getCourseNo());
				System.out.println("\tCredits:         " + c.getCredits());
				System.out.println("\tGrade Received:  " + te.getGrade());
				System.out.println("\t-----");
			}
	}
}
