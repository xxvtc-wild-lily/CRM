package com.ysd.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.EmployeeCheckMapper;
import com.ysd.entity.EmployeeCheck;
import com.ysd.entity.Pagination;

@Service
public class EmployeeCheckServiceImpl implements EmployeeCheckService {
    
    @Autowired
    private EmployeeCheckMapper employeeCheckMapper;

    @Override
    public List<EmployeeCheck> selectAllEmployeeCheck(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllEmployeeCheck(pagination);
        
        return list;
    }

    @Override
    public Integer selectAllEmployeeCheckCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllEmployeeCheckCount(pagination);
        
        return i;
    }

    @Override
    public List<EmployeeCheck> selectAllNotCheckEmployee(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllNotCheckEmployee(pagination);
        
        return list;
    }

    @Override
    public Integer selectAllNotCheckEmployeeCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllNotCheckEmployeeCount(pagination);
        
        return i;
    }
}
