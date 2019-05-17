package com.ysd.service;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeCheck;

public interface RegisterService {
    
    /**
     * 添加员工签到记录
     * @param employee 包含签到信息的员工类
     * @return 受影响的行数
     */
    Integer insertEmployeeCheck(Employee employee);
    
    /**
     * 查询今天是否已经签到
     * @param employeeCheck 员工签到类，包含员工签到信息
     * @return 查询到的今天的签到记录条数
     */
    Integer selectIsTodayHaveCheckIn(EmployeeCheck employeeCheck);
    
    /**
     * 查询今天是否已经签退
     * @param employeeCheck 员工签到类，包含员工签到信息
     * @return 查询到的今天的签退记录条数
     */
    Integer selectIsTodayHaveCheckOut(EmployeeCheck employeeCheck);
    
    /**
     * 添加员工签退记录
     * @param employee 包含签到信息的员工类
     * @return 受影响的行数
     */
    Integer updateEmployeeCheck(Employee employee);
    
    /**
     * 签到时更改用户的签到状态
     * @param employee 包含签到信息的员工类
     * @return 受影响的行数
     */
    Integer updateEmployeeCheckStatus(Employee employee);
    
    /**
     * 签退时更改用户的签到状态
     * @param employee 包含签到信息的员工类
     * @return 受影响的行数
     */
    Integer updateEmployeeCheckOutStatus(Employee employee);
    
}
