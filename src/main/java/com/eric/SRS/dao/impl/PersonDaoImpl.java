package com.eric.SRS.dao.impl;

import org.hibernate.Query;

import com.eric.SRS.dao.PersonDao;
import com.eric.SRS.model.Person;

public class PersonDaoImpl extends BaseDaoHibernate4<Person> implements PersonDao {

	public Person getByPersonId(String personId) {
		Query query = getSessionFactory().getCurrentSession().createQuery("select p from Person p where id=:personId")
				.setString("personId", personId);
		return (Person) query.uniqueResult();
	}
	@Override
	public Person getBySsn(Person person) {
		return find(" from Person  where ssn like '"+person.getSsn()+"'").get(0);
	}
}
