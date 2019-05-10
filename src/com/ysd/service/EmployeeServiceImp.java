package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.EmployeeMapper;
import com.ysd.entity.Employee;
import com.ysd.entity.Fenye;
@Service
public class EmployeeServiceImp implements EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Override
	public Fenye<Employee> selectEmployeeAll(Fenye<Employee> fenye) {
		List<Employee> selectEmployeeAll = employeeMapper.selectEmployeeAll(fenye);
		Integer selectEmployeeCount = employeeMapper.selectEmployeeCount(fenye);
		fenye.setRows(selectEmployeeAll);
		fenye.setTotal(selectEmployeeCount);
		return fenye;
	}

}
