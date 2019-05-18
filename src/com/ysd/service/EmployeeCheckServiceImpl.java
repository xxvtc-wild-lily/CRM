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
    public List<EmployeeCheck> selectAllEmployeeCheckA(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllEmployeeCheckA(pagination);
        
        return list;
    }
    
    @Override
    public List<EmployeeCheck> selectAllEmployeeCheckB(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllEmployeeCheckB(pagination);
        
        return list;
    }

    @Override
    public Integer selectAllEmployeeCheckCountA(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllEmployeeCheckCountA(pagination);
        
        return i;
    }

    @Override
    public Integer selectAllEmployeeCheckCountB(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllEmployeeCheckCountB(pagination);
        
        return i;
    }
    
}
