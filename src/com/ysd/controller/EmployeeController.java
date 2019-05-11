package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Employee;
import com.ysd.entity.Fenye;
import com.ysd.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private Fenye<Employee> fenye;
	
	@RequestMapping(value="/selectEmployee",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Employee> selectEmployee(Integer rows,Integer page, Employee employee,String in_e_createTime,String en_e_createTime){
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye.setEmployee(employee);
		fenye.setIn_e_createTime(in_e_createTime);
		fenye.setEn_e_createTime(en_e_createTime);
		fenye=employeeService.selectEmployeeAll(fenye);
		return fenye;
	}
	@RequestMapping(value="/insertEmployee",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertEmployee(Employee employee) {
		return employeeService.insertEmployee(employee);
	}
	@RequestMapping(value="/deleteEmployee",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteEmployee(Integer e_id) {
		return employeeService.deleteEmployee(e_id);
	}
}
