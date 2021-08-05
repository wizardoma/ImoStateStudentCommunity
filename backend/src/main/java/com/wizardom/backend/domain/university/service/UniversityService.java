package com.wizardom.backend.domain.university.service;

import com.wizardom.backend.domain.BaseService;
import com.wizardom.backend.domain.department.model.Department;
import com.wizardom.backend.domain.university.model.University;
import org.springframework.stereotype.Service;

import java.util.List;

public abstract class UniversityService extends BaseService {

    public abstract University getUniversityById(long universityId);
    public abstract List<University> getUniversities();
    public abstract University getByShortName(String shortName);
    public abstract List<Department> getDepartmentsOfUniversity(long universityId);
}
