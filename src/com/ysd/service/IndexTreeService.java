package com.ysd.service;

import java.util.List;

import com.ysd.entity.Employee;
import com.ysd.entity.Modules;

public interface IndexTreeService {
    
    /**
     * 根据用户名查询该员工的所有模块
     * @param emloyee 包含员工信息的员工类
     * @return 查询到的模块信息list集合
     */
    List<Modules> selectEmployeeAllModules(Employee employee);
    
    /**
     * 跟据用户名获取到当前用户的手机号
     * @param employee 包含员工信息的员工类
     * @return 查询到的手机号
     */
    String selectProtectMTelByLoginName(Employee employee);
    
    /**
     * 根据登录名获取用户的指纹码
     * @param employee 包含员工信息的员工类
     * @return 查询到的用户指纹码
     */
    String selectFingerprintNumByLoginName(Employee employee);
    
    /**
     * 根据用户名修改密码
     * @param employee 包含员工信息的员工类
     * @return 受影响的行数
     */
    Integer updatePasswordByLoginName(Employee employee);
    
    /**
     * 查询旧密码是否正确
     * @param employee 包含员工信息的员工类
     * @return 查询到的行数
     */
    Integer selectIsOldPasswordSame(Employee employee);
    
}
