package com.eric.SRS.dao;

import java.util.HashMap;

import com.eric.SRS.model.Section;

public interface SectionDao extends BaseDao<Section> {
	public Section getBySectionNo(int sectionNo);
	public HashMap<String,Section> getBySemester(String semester);
}
