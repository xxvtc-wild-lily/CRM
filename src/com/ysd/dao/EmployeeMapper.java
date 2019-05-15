package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Employee;
import com.ysd.entity.Pagination;

public interface EmployeeMapper {
	
	List<Employee> selectEmployeeAll(Pagination<Employee> pagination);
	
	Integer selectEmployeeCount(Pagination<Employee> pagination);
	
	
	Integer deleteEmployee(Integer e_id);
	
	Integer updateEmployee(Employee employee);
}
