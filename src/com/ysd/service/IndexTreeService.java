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
    
}
