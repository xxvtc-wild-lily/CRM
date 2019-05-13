package com.ysd.service;

import com.ysd.entity.Employee;
import com.ysd.entity.Pagination;

public interface EmployeeService {
	Pagination<Employee> selectEmployeeAll(Pagination<Employee> pagination);
	Integer insertEmployee(Employee employee);
	Integer deleteEmployee(Integer e_id);
	Integer updateEmployee(Employee employee);
}
