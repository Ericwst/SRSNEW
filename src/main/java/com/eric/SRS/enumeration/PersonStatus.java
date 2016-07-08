package com.eric.SRS.enumeration;

public enum PersonStatus {

	ENROLL, LOGIN, TRANSCRIPT, PROFESSOR, STUDENT, LOGOUT;

	public String toString() {
		switch (this) {
		case STUDENT:
			return "student";
		case PROFESSOR:
			return "professor";
		case LOGIN:
			return "login";
		case LOGOUT:
			return "logout";
		case TRANSCRIPT:
			return "transcript";
		default:
			return "unspecified";
		}
	}
}
