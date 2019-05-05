package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Employee;

public interface EmployeeMapper {
	List<Employee> selectEmployeeAll();
}
