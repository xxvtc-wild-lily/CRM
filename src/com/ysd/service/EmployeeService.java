package com.ysd.service;

import java.util.List;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Message;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;

public interface EmployeeService {
	Pagination<Employee> selectEmployeeAll(Pagination<Employee> pagination);
	/**
	 * 根据员工ID删除员工
	 * @param e_id
	 * @return
	 */
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
    Integer insertRoleForEmployee(String arr,EmployeeRole employeeRole,String e_name,String r_name);
    
    /**
     * 根据用户id删除角色
     * @param employeeRole 包含删除信息的用户角色类
     * @return 受影响的行数
     */
    Integer deleteRoleForEmployee(String arr,EmployeeRole employeeRole,String r_name,String name);
    
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
    /**
     * 根据员工角色显示统计图
     * @return
     */
    List selectTongJiTu(String e_loginName);
    
    /**
     * 查询角色模块中间表数据数量
     * @return
     */
    Integer selectEmployeeroleCount();
    /**
	 * 根据学生id查询所属咨询师姓名
	 * @param sid
	 * @return
	 */
    String selectStudentByIdEmpName(Integer tidsss,String name,String mess);
    /**
     * 当咨询师离线时添加离线消息
     * @param message
     * @return
     */
    Integer insertMessage(String message);
    /**
     * 根据员工登录名查询未读消息
     * @param name
     * @return
     */
    List<Message> selectEmpByname(String name);
    /**
     * 根据员工登录名修改消息状态
     * @param name
     * @return
     */
    Integer updateMessByEmpName(String name);
}
