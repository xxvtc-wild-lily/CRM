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
    
}
