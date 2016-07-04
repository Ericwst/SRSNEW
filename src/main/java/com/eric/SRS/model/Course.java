package com.eric.SRS.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "course")
public class Course implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "course_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int courseId;

	private String courseNo;

	private String courseName;

	private double credits;

	@OneToMany(targetEntity = Section.class, mappedBy = "representedCourse", cascade = CascadeType.ALL)
	private List<Section> offeredAsSection = new ArrayList<Section>();

	@OneToMany(targetEntity = Course.class, cascade = CascadeType.ALL)
	private List<Course> prerequisites = new ArrayList<>();

	public Course() {
		super();
	}

	public Course(String cNo, String cName, double credits) {
		setCourseNo(cNo);
		setCourseName(cName);
		setCredits(credits);

		// Note that we're instantiating empty support Collection(s).

		offeredAsSection = new ArrayList<Section>();
		prerequisites = new ArrayList<Course>();
	}

	// ------------------
	// Accessor methods.
	// ------------------

	public void setCourseNo(String cNo) {
		courseNo = cNo;
	}

	public String getCourseNo() {
		return courseNo;
	}

	public void setCourseName(String cName) {
		courseName = cName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCredits(double c) {
		credits = c;
	}

	public double getCredits() {
		return credits;
	}

	// -----------------------------
	// Miscellaneous other methods.
	// -----------------------------

	public void display() {
		System.out.println("Course Information:");
		System.out.println("\tCourse No.:  " + getCourseNo());
		System.out.println("\tCourse Name:  " + getCourseName());
		System.out.println("\tCredits:  " + getCredits());
		System.out.println("\tPrerequisite Courses:");

		for (Course c : prerequisites) {
			System.out.println("\t\t" + c.toString());
		}

		// Note use of print vs. println in next line of code.

		System.out.print("\tOffered As Section(s):  ");
		for (Section s : offeredAsSection) {
			System.out.print(s.getSectionNo() + " ");
		}

		// Finish with a blank line.

		System.out.println();
	}

	@Override
	public String toString() {
		return getCourseNo() + ":  " + getCourseName();
	}

	public void addPrerequisite(Course c) {
		prerequisites.add(c);
	}

	public boolean hasPrerequisites() {
		if (prerequisites.size() > 0)
			return true;
		else
			return false;
	}

	public Collection<Course> getPrerequisites() {
		return prerequisites;
	}

	public Section scheduleSection(char day, String time, String room, int capacity) {
		// Create a new Section (note the creative way in
		// which we are assigning a section number) ...

		Section s = new Section(offeredAsSection.size() + 1, day, time, this, room, capacity);

		// ... and then remember it!

		addSection(s);

		return s;
	}

	public void addSection(Section s) {
		offeredAsSection.add(s);
	}
}
