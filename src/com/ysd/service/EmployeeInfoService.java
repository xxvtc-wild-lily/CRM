package com.ysd.service;

import java.util.List;

import com.ysd.entity.Employee;

public interface EmployeeInfoService {
	/**
	 * 
	 * @param emp
	 * @return
	 */
	List<Employee> selectEmployeeInfo(Employee employee);
}
