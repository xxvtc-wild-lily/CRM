package com.ysd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Employee;
import com.ysd.service.EmployeeInfoServiceImpl;

@Controller
public class EmployeeInfoController {
	@Autowired
	private EmployeeInfoServiceImpl empinfoimpl;
	 @RequestMapping(value="/selectEmployeeInfo",method=RequestMethod.POST)
	    @ResponseBody
	public List<Employee> selectEmployeeInfo(Employee employee) {
		// TODO Auto-generated method stub
		return empinfoimpl.selectEmployeeInfo(employee);
	}
}
