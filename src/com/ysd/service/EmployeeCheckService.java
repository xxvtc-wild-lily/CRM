package com.ysd.service;

import java.util.List;

import com.ysd.entity.EmployeeCheck;
import com.ysd.entity.Pagination;

public interface EmployeeCheckService {
    
    /**
     * 不查询是否签到的分页查询签到记录
     * @param pagination 包含查询信息的分页类
     * @return 查询到的签到记录list集合
     */
    List<EmployeeCheck> selectAllEmployeeCheckA(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询是否签到的分页查询签到记录
     * @param pagination 包含查询信息的分页类
     * @return 查询到的签到记录list集合
     */
    List<EmployeeCheck> selectAllEmployeeCheckB(Pagination<EmployeeCheck> pagination);
    
    /**
     * 不查询是否签到的分页查询签到记录
     * @param pagination 包含查询信息的分页类
     * @return 查询到的总条数
     */
    Integer selectAllEmployeeCheckCountA(Pagination<EmployeeCheck> pagination);
    
    /**
     * 不查询是否签到的分页查询签到记录
     * @param pagination 包含查询信息的分页类
     * @return 查询到的总条数
     */
    Integer selectAllEmployeeCheckCountB(Pagination<EmployeeCheck> pagination);
    
}
