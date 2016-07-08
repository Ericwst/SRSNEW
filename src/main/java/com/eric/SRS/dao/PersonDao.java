package com.eric.SRS.dao;

import com.eric.SRS.model.Person;

public interface PersonDao extends BaseDao<Person> {
	public Person getByPersonId(String personId);
	public Person getBySsn(Person person);
}
