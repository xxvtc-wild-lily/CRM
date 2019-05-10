package com.ysd.service;

import com.ysd.entity.Employee;
import com.ysd.entity.Fenye;

public interface EmployeeService {
	Fenye<Employee> selectEmployeeAll(Fenye<Employee> fenye);
}
