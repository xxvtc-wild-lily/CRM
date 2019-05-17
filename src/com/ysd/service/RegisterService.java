package com.ysd.service;

import com.ysd.entity.Employee;

public interface RegisterService {
    
    /**
     * 添加员工签到记录
     * @param employee 包含签到信息的员工类
     * @return 受影响的行数
     */
    Integer insertEmployeeCheck(Employee employee);
    
    /**
     * 添加员工签退记录
     * @param employee 包含签到信息的员工类
     * @return 受影响的行数
     */
    Integer updateEmployeeCheck(Employee employee);
    
}
