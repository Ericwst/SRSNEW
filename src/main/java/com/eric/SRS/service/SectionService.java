package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.Section;

public interface SectionService {

	int addSection(Section section);

	List<Section> getAllSections();

	void deleteSection(int sectionNo);

	Section getBySectionNo(int sectionNo);

	void updateSection(Section section);
}
