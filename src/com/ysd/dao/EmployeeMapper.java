package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;

public interface EmployeeMapper {
	/**
	 * 分页查询所有员工
	 * @param pagination
	 * @return
	 */
	List<Employee> selectEmployeeAll(Pagination<Employee> pagination);
	/**
	 * 分页查询员工总数
	 * @param pagination
	 * @return
	 */
	Integer selectEmployeeCount(Pagination<Employee> pagination);
	
	/**
	 * 根据ID删除员工信息
	 * @param e_id
	 * @return
	 */
	Integer deleteEmployee(Integer e_id);
	/**
	 * 根据员工ID查询在跟进的学生数量
	 * @param e_id
	 * @return
	 */
	Integer selectGenJinStudentCountById(Integer e_id);
	/**
	 * 根据ID修改员工信息
	 * @param employee
	 * @return
	 */
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
