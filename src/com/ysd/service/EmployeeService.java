package com.ysd.service;

import java.util.List;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;

public interface EmployeeService {
	Pagination<Employee> selectEmployeeAll(Pagination<Employee> pagination);
	Integer deleteEmployee(Integer e_id);
	Integer updateEmployee(Employee employee);
	
	/**
     * 查询所有的角色
     * @return 查询到的角色list集合
     */
    List<Role> selectAllRole();
    
    /**
     * 查询用户已经拥有的角色id
     * @param employee 包含员工信息的员工类
     * @return 查询出的该员工拥有的员工id
     */
    List<Role> selectEmployeeRoleByName(Employee employee);
    
    /**
     * 根据用户id添加用户角色
     * @param employeeRole 包含添加信息的用户角色类
     * @return 受影响的行数
     */
    Integer insertRoleForEmployee(EmployeeRole employeeRole);
    
}
