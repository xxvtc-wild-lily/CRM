package com.ysd.service;

import com.ysd.entity.Employee;
import com.ysd.entity.Fenye;

public interface EmployeeService {
	Fenye<Employee> selectEmployeeAll(Fenye<Employee> fenye);
	Integer insertEmployee(Employee employee);
	Integer deleteEmployee(Integer e_id);
	Integer updateEmployee(Employee employee);
}
