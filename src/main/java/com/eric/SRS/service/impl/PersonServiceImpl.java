package com.eric.SRS.service.impl;

import java.util.List;

import com.eric.SRS.dao.PersonDao;
import com.eric.SRS.model.Person;
import com.eric.SRS.service.PersonService;

public class PersonServiceImpl implements PersonService {
	
	private PersonDao personDao;
	public void setPersonDao(PersonDao personDao) {
		this.personDao = personDao;
	}

	@Override
	public int addPerson(Person person) {
		// TODO Auto-generated method stub
		return (Integer)personDao.save(person);
	}

	@Override
	public void deletePerson(int personId) {
		// TODO Auto-generated method stub
		personDao.delete(Person.class, personId);
	}

	@Override
	public List<Person> getAllPersons() {
		// TODO Auto-generated method stub
		return personDao.findAll(Person.class);
	}

	@Override
	public Person getBySsn(Person person) {
		return personDao.getBySsn(person);
	}
	
	@Override
	public Boolean login(Person person) {
		return personDao.getBySsn(person).getPassword().equals(person.getPassword());
	}
}
