package com.eric.SRS.action;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.eric.SRS.enumeration.PersonStatus;
import com.eric.SRS.model.Person;
import com.eric.SRS.service.PersonService;

public class PersonAction extends SuperAction<Person> {

	private static final long serialVersionUID = 1L;
	private PersonService personService;
	private Person person;

	@Override
	public String execute() throws Exception {
		return super.execute();
	}
	
	public PersonService getPersonService() {
		return personService;
	}

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	public String login() {
		Boolean value = personService.login(model);
		System.out.println(value);
		if (value) {
			session.setAttribute("person", personService.getBySsn(model));
		}
		System.out.println(session.getAttribute("person"));
		if (person.getStatus().equals("0")) {
			return PersonStatus.STUDENT.toString();
		} else {
			return PersonStatus.PROFESSOR.toString();
		}
	}

	@SkipValidation // 只对登录进行验证，注销不需要
	public String logout() {
		if (session.getAttribute("person") != null) {
			session.removeAttribute("person");
		}
		return PersonStatus.LOGOUT.toString();
	}

	// 表单验证的一个方法
	public void validate() {

		super.validate();
		if ("".equals(person.getSsn().trim())) {
			this.addFieldError("ssnError", "ssn不能为空");
		}
		if (person.getPassword().length() < 6) {
			this.addFieldError("passwordError", "密码长度不能小于6位");
		}
	}

}
