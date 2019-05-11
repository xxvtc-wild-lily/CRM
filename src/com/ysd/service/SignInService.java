package com.ysd.service;

import com.ysd.entity.Employee;

public interface SignInService {
    
    /**
     * 查询是否存在正在登录名
     * @param employee 包含用户信息的用户类
     * @return 查询到的行数
     */
    Integer selectIsHaveSameLoginName(Employee employee);
    
    /**
     * 根据登录名获取用户的指纹码
     * @param employee 包含用户信息的用户类
     * @return 查询到的用户指纹码
     */
    String selectFingerprintNumByLoginName(Employee employee);
    
    /**
     * 查询用户输入的密码是否正确
     * @param employee 包含员工信息的员工类，其中的密码已经经过MD5盐加密
     * @return 查询到的符合条件的行数
     */
    Integer selectIsPasswordRight(Employee employee);
    
    /**
     * 密码输入错误后修改密码错误次数
     * @param employee 包含员工信息的员工类
     * @return 受影响的行数
     */
    Integer updatePwdWrongTime(Employee employee);
    
    /**
     * 查询该用户密码的错误次数
     * @param employee 包含员工信息的员工类
     * @return 错误次数
     */
    Integer selectPwdWrongTime(Employee employee);
    
    /**
     * 修改用户的锁定状态为锁定，修改锁定时间为当前时间
     * @param employee 包含员工信息的员工类
     * @return 受影响的行数
     */
    Integer updateEmployeeIsLockOut(Employee employee);
    
    /**
     * 查询用户是否锁定
     * @param employee 包含员工信息的员工类
     * @return 查询到的符合条件的行数
     */
    Integer selectIsEmployeeLockOut(Employee employee);
    
    /**
     * 修改用户的最后登录时间
     * @param employee 包含员工信息的员工类
     * @return 受影响的行数
     */
    Integer updateLastLoginTime(Employee employee);
    
    /**
     * 登录成功后将用户的密码错误次数重设为0
     * @param employee 包含员工信息的员工类
     * @return 受影响的行数
     */
    Integer updatePwdWrongTimeWhenSuccess(Employee employee);
    
}
