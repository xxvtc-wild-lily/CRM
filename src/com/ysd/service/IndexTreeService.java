package com.ysd.service;

import java.util.List;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Modules;
import com.ysd.entity.RoleModules;

public interface IndexTreeService {
    
    /**
     * 获取该员工的所有角色
     * @param employee 包含员工信息的员工类
     * @return 查询出的角色
     */
    List<EmployeeRole> selectAllRoleByLoginName(Employee employee);
    
    /**
     * 根据角色id获取相应的模块id
     * @param r_id 角色id
     * @return 查询出的模块id
     */
    List<RoleModules> selectAllRoleModulesByRoleId(Integer r_id);
    
    /**
     * 根据模块id获取相应的模块信息
     * @param m_id 模块id
     * @return 产寻出的模块信息
     */
    Modules selectAllModulesByMid(Integer m_id);
    
}
