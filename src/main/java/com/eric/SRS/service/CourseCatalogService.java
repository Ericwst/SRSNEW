package com.eric.SRS.service;

import java.util.List;

import com.eric.SRS.model.CourseCatalog;

public interface CourseCatalogService
{
	
	int addCourseCatalog(CourseCatalog courseCatalog);

	List<CourseCatalog> getAllCourseCatalogs();
	
	void deleteCourseCatalog(int courseCatalogId);
	
	CourseCatalog getByCourseCatalogId(int courseCatalogId);
}
