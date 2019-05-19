package com.ysd.service;

import java.util.List;

import com.ysd.entity.EmployeeCheck;
import com.ysd.entity.Pagination;

public interface EmployeeCheckService {
    
    /**
     * 查询所有签到记录
     * @param pagination 包含查询信息的分页类
     * @return 查询到的签到记录list集合
     */
    List<EmployeeCheck> selectAllEmployeeCheck(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询所有签到记录的总数
     * @param pagination 包含查询信息的分页类
     * @return 查询到的总条数
     */
    Integer selectAllEmployeeCheckCount(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询所有没签到的人的记录
     * @param pagination 包含查询信息的分页类
     * @return 查询到的没签到的人的签到记录list集合
     */
    List<EmployeeCheck> selectAllNotCheckEmployee(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询所有没签到的人的记录条数
     * @param pagination 包含查询信息的分页类
     * @return 查询到的总条数
     */
    Integer selectAllNotCheckEmployeeCount(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询所有签到的人的记录条数
     * @param pagination 包含查询信息的分页类
     * @return 查询到的所有签到的人的签到记录list集合
     */
    List<EmployeeCheck> selectAllHasCheckInEmployee(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询所有签到的人的记录条数
     * @param pagination 包含查询信息的分页类
     * @return 查询到的总条数
     */
    Integer selectAllHasCheckInEmployeeCount(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询所有签退的人的记录
     * @param pagination 包含查询信息的分页类
     * @return 查询到的所有签退的人的签到记录list集合
     */
    List<EmployeeCheck> selectAllHasCheckOutEmployee(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询所有签退的人的记录条数
     * @param pagination 包含查询信息的分页类
     * @return 查询到的总条数
     */
    Integer selectAllHasCheckOutEmployeeCount(Pagination<EmployeeCheck> pagination);
    
}
