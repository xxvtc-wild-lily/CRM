package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Employee;

public interface EmployeeInfoMapper {
	/**
	 * 根据用户名查询用户所有信息
	 * @return
	 */
	List<Employee> selectEmployeeInfo(Employee employee);
}
