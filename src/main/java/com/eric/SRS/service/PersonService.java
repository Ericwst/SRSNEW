package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.Person;
import com.eric.SRS.model.Student;

public interface PersonService {

	int addPerson(Person person);

	void deletePerson(int id);

	List<Person> getAllPersons();

	public Person getBySsn(Person person);

	public Boolean login(Person person);
}
