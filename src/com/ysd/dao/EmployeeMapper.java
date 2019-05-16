package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;

public interface EmployeeMapper {
	
	List<Employee> selectEmployeeAll(Pagination<Employee> pagination);
	
	Integer selectEmployeeCount(Pagination<Employee> pagination);
	
	
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
	
	/**
	 * 根据用户id删除角色
	 * @param employeeRole 包含删除信息的用户角色类
	 * @return 受影响的行数
	 */
	Integer deleteRoleForEmployee(EmployeeRole employeeRole);
	
	/**
	 * 根据用户名重置密码
	 * @param employee 包含员工信息的员工类
	 * @return 受影响的行数
	 */
	Integer updateEmployeePassword(Employee employee);
	
	/**
     * 根据登录名获取用户的指纹码
     * @param employee 包含员工信息的员工类
     * @return 查询到的用户指纹码
     */
    String selectFingerprintNumByLoginName(Employee employee);
    
    /**
     * 修改锁定状态为已锁定
     * @param employee 包含员工信息的员工类
     * @return 受影响的行数
     */
    Integer updateEmployeeLock(Employee employee);
    
    /**
     * 修改锁定状态为未锁定
     * @param employee 包含员工信息的员工类
     * @return 受影响的行数
     */
    Integer updateEmployeeUnLock(Employee employee);
	
}
