package com.eric.SRS.dao;

import com.eric.SRS.model.CourseCatalog;

public interface CourseCatalogDao extends BaseDao<CourseCatalog> {

	public CourseCatalog getByCourseCatalogId(int courseCatalogId);
}
