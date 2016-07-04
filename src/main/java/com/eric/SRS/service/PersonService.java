package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.Person;

public interface PersonService {

	int addPerson(Person person);

	void deletePerson(int id);

	List<Person> getAllPersons();

}
