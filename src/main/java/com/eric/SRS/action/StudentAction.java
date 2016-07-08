package com.eric.SRS.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eric.SRS.enumeration.EnrollmentStatus;
import com.eric.SRS.enumeration.PersonStatus;
import com.eric.SRS.model.Section;
import com.eric.SRS.model.Student;
import com.eric.SRS.model.TranscriptEntry;
import com.eric.SRS.service.StudentService;
import com.eric.SRS.service.TranscriptEntryService;

/**
 * @author Ericwst
 *
 */
public class StudentAction extends SuperAction<Student> {

	private static final long serialVersionUID = 1L;

	private StudentService studentService;
	private TranscriptEntryService transcriptEntryService;
	private Student student;
	private List<Student> students;
	private Map<String, Object> jsonMap = new HashMap<>();
	private Integer sectionId;
	private int id;

	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	public void setTranscriptEntryService(TranscriptEntryService transcriptEntryService) {
		this.transcriptEntryService = transcriptEntryService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public void setJsonMap(Map<String, Object> jsonMap) {
		this.jsonMap = jsonMap;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public void setSectionId(Integer sectionId) {
		this.sectionId = sectionId;
	}

	public Integer getSectionId() {
		return sectionId;
	}

	// 处理添加学生的add()方法
	public String add() {
		// 调用业务逻辑组件的addBook()方法来处理用户请求
		int result = studentService.addStudent(student);
		if (result > 0) {
			addActionMessage("添加成功");
			return SUCCESS;
		}
		addActionError("添加失败，请重新添加");
		return ERROR;
	}

	public String list() {
		setStudents(studentService.getAllStudents());
		return SUCCESS;
	}

	public String delete() {
		studentService.deleteStudent(id);
		return SUCCESS;
	}

	public String enroll() {
		Student student = (Student) session.getAttribute("student");
		Section section = new Section();
		section.setSectionNo(sectionId);
		EnrollmentStatus enrollmentStatus = studentService.enroll(section, student);
		jsonMap.put("message", enrollmentStatus);
		return PersonStatus.ENROLL.toString();
	}

	public List<TranscriptEntry> selectTranscript() {
		Student student = new Student();
		student.setId(1);
		List<TranscriptEntry> transcriptEntries = transcriptEntryService.getByStudent(student);
		return transcriptEntries;
	}

	public String deleteTranscript() {
		transcriptEntryService.deleteSection(sectionId);
		return PersonStatus.TRANSCRIPT.toString();
	}

}