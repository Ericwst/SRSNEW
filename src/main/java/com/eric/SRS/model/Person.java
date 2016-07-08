package com.eric.SRS.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Table(name = "person")
public abstract class Person implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// ------------
	// Attributes.
	// ------------
	@Id
	@Column(name = "person_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "ssn", length = 50, unique = true, nullable = false)
	private String ssn;
	private String name;
	private String password;
	private String status;

	// ----------------
	// Constructor(s).
	// ----------------

	public Person(String name, String ssn, String password) {
		this.setName(name);
		this.setSsn(ssn);
		this.setPassword(password);
	}

	public Person() {
		this.setName("?");
		this.setSsn("???-??-????");
		this.setPassword("???-??-????");
	}

	// ------------------
	// Accessor methods.
	// ------------------

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String n) {
		name = n;
	}

	public String getName() {
		return name;
	}

	public void setSsn(String s) {
		ssn = s;
	}

	public String getSsn() {
		return ssn;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// -----------------------------
	// Miscellaneous other methods.
	// -----------------------------

	// We'll let each subclass determine how it wishes to be
	// represented as a String value.

	@Override
	public abstract String toString();

	public void display() {
		System.out.println("Person Information:");
		System.out.println("\tName:  " + this.getName());
		System.out.println("\tSoc. Security No.:  " + this.getSsn());
	}

}
