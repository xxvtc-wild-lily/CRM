package com.ysd.dao;

import java.util.List;

import com.ysd.entity.EmployeeCheck;
import com.ysd.entity.Pagination;

public interface EmployeeCheckMapper {
    
    /**
     * 分页查询签到记录
     * @param pagination 包含查询信息的分页类
     * @return 查询到的签到记录list集合
     */
    List<EmployeeCheck> selectAllEmployeeCheck(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询出的总条数
     * @param pagination 包含查询信息的分页类
     * @return 查询到的总条数
     */
    Integer selectAllEmployeeCheckCount(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询今天没签到且没判断日期的人
     * @param pagination 包含查询条件的分页类
     * @return 查询到的没签到记录的list集合
     */
    List<EmployeeCheck> selectAllNotCheckEmployee(Pagination<EmployeeCheck> pagination);
    
    /**
     * 查询到今天没签到且没判断日期的人数
     * @param pagination 包含查询条件的分页类
     * @return 查询到的总条数
     */
    Integer selectAllNotCheckEmployeeCount(Pagination<EmployeeCheck> pagination);
    
}
