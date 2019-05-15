package com.ysd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;
import com.ysd.service.EmployeeService;

@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private Pagination<Employee> pagination;
	
	@RequestMapping(value="/selectEmployee",method=RequestMethod.POST)
	@ResponseBody
	public Pagination<Employee> selectEmployee(Integer rows,Integer page, Employee employee,String in_e_createTime,String en_e_createTime){
		pagination.setPage((page-1)*rows);
		pagination.setPageSize(rows);
		pagination.setEmployee(employee);
		pagination.setIn_e_createTime(in_e_createTime);
		pagination.setEn_e_createTime(en_e_createTime);
		pagination=employeeService.selectEmployeeAll(pagination);
		return pagination;
	}
	
	@RequestMapping(value="/deleteEmployee",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteEmployee(Integer e_id) {
		return employeeService.deleteEmployee(e_id);
	}
	
	@RequestMapping(value="/updateEmployee",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateEmployee(Employee employee) {
		return employeeService.updateEmployee(employee);
	}
	
	@RequestMapping(value="/getAllRole",method=RequestMethod.POST)
    @ResponseBody
    public List<Role> getAllRole() {
	    
	    // 查询到的所有角色
	    List<Role> list = employeeService.selectAllRole();
	    
	    return list;
    }
	
	@RequestMapping(value="/getEmployeeRole",method=RequestMethod.POST)
    @ResponseBody
    public List<Role> getEmployeeRole(Employee employee) {
        
        // 查询到的所有角色
        List<Role> list = employeeService.selectEmployeeRoleByName(employee);
        
        return list;
    }
	
	@RequestMapping(value="/removeRoleToEmployee",method=RequestMethod.POST)
    @ResponseBody
	public Integer removeRoleToEmployee(@RequestParam("arr") String arr,EmployeeRole employeeRole) {
	    
	    String[] ridArr = arr.split(",");
	    Integer code = 0;
	    for (int i = 0;i < ridArr.length;i++) {
	        employeeRole.setR_id(Integer.parseInt(ridArr[i]));
	        code = employeeService.insertRoleForEmployee(employeeRole);
	    }
	    
	    return code;
	}
	
}
