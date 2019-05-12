package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Employee;
import com.ysd.entity.Fenye;

public interface EmployeeMapper {
	
	List<Employee> selectEmployeeAll(Fenye<Employee> fenye);
	
	Integer selectEmployeeCount(Fenye<Employee> fenye);
	
	Integer insertEmployee(Employee employee);
	
	Integer deleteEmployee(Integer e_id);
	
	Integer updateEmployee(Employee employee);
}
