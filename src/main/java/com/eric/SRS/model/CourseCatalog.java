package com.eric.SRS.model;
// CourseCatalog.java - Chapter 15, Java 5 version.

// Copyright 2005 by Jacquie Barker - all rights reserved.

// An IMPLEMENTATION class.

// As mentioned in Chapter 14, we've decided to encapsulate a Collection
// of Courses within the CourseCatalog class the way that we encapsulated a
// Collection of Sections within the ScheduleOfClasses class in Chapter 14.
// This provides an increased level of abstraction in our application.

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "courseCatalog")
public class CourseCatalog implements java.io.Serializable{
	// ------------
	// Attributes.
	// ------------

	// This HashMap stores Course object references, using
	// the course no. of the Course (a String) as the key.

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "courseCatalog_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int courseCatalogId;

	@OneToMany(targetEntity = Course.class)
	@JoinColumn(name = "courseCatalog_id", referencedColumnName = "courseCatalog_id")
	private Map<String, Course> courses=new HashMap<String, Course>();

	// ----------------
	// Constructor(s).
	// ----------------

	public CourseCatalog() {
		// Note that we're instantiating empty support Collection(s).

		courses = new HashMap<String, Course>();
	}

	public CourseCatalog(HashMap<String, Course> courses) {
		// Note that we're instantiating empty support Collection(s).

		this.courses = courses;
	}

	// ------------------
	// Accessor methods.
	// ------------------

	// None!

	// -----------------------------
	// Miscellaneous other methods.
	// -----------------------------

	public void display() {
		// Iterate through the HashMap and display all entries.

		for (Course c : courses.values()) {
			c.display();
			System.out.println();
		}
	}

	public void addCourse(Course c) {
		// We use the course no. as the key.

		String key = c.getCourseNo();
		courses.put(key, c);
	}

	public Course findCourse(String courseNo) {
		return courses.get(courseNo);
	}

	public boolean isEmpty() {
		if (courses.size() == 0)
			return true;
		else
			return false;
	}
}
