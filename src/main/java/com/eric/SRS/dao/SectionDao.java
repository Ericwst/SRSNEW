package com.eric.SRS.dao;

import com.eric.SRS.model.Section;

public interface SectionDao extends BaseDao<Section> {
	public Section getBySectionNo(int sectionNo);
}
