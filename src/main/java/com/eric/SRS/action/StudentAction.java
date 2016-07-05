package com.eric.SRS.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.eric.SRS.enumeration.EnrollmentStatus;
import com.eric.SRS.model.Section;
import com.eric.SRS.model.Student;
import com.eric.SRS.model.TranscriptEntry;
import com.eric.SRS.service.StudentService;
import com.eric.SRS.service.TranscriptEntryService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Ericwst
 *
 */
public class StudentAction extends ActionSupport implements ServletRequestAware {

	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	private static final long serialVersionUID = 1L;
	private Student student;
	private StudentService studentService;
	private TranscriptEntryService transcriptEntryService;
	private Map<String, Object> jsonMap = new HashMap<>();
	private Integer sectionId;
	private String ids;
	private HttpSession session;
	private HttpServletRequest request;

	public void setTranscriptEntryService(TranscriptEntryService transcriptEntryService) {
		this.transcriptEntryService = transcriptEntryService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
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

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getIds() {
		return ids;
	}

	public String login() {
		Boolean value = studentService.login(student);
		System.out.println(value);
		if (value) {
			session.setAttribute("student", studentService.getBySsn(student));
		}
		System.out.println(session.getAttribute("student"));
		// jsonMap.put("massage", value);
		return "login";
	}

	public String enroll() {
		System.out.println("session=================" + (Student) session.getAttribute("student"));
		Student student = (Student) session.getAttribute("student");
		// Student student=new Student();
		// student.setId(1);
		Section section = new Section();
		section.setSectionNo(sectionId);
		// System.out.println(sectionId);
		EnrollmentStatus enrollmentStatus = studentService.enroll(section, student);
		System.out.println("===================enrollmentStatus:" + enrollmentStatus);
		jsonMap.put("message", enrollmentStatus);
		return "enroll";
	}

	public String queryTranscript() {
		// Transcript transcript=transcriptEntryService.findByStudent(model);
		Student student = new Student();
		student.setId(1);
		List<TranscriptEntry> transcriptEntries = transcriptEntryService.getByStudent(student);
		// System.out.println("=============transcript=======");
		// System.out.println(transcriptEntries);
		jsonMap.put("rows", transcriptEntries);
		jsonMap.put("total", transcriptEntries.size());
		return "queryTranscript";
	}

	public String deleteTranscript() {
		// System.out.println(ids);
		for (int i = 0; i < ids.split(",").length; i++) {
			transcriptEntryService.deleteSection(Integer.parseInt(ids.split(",")[i]));
		}
		jsonMap.put("message", true);
		return "queryTranscript";
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		this.session = this.request.getSession();
	}
}