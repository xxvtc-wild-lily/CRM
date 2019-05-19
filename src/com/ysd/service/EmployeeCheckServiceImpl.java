package com.ysd.service;

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
        
        for (int i = 0;i < list.size();i++) {
            list.get(i).setEc_ext5(1);
        }
        
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
        
        for (int i = 0;i < list.size();i++) {
            list.get(i).setEc_ext5(2);
        }
        
        return list;
    }

    @Override
    public Integer selectAllNotCheckEmployeeCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllNotCheckEmployeeCount(pagination);
        
        return i;
    }

    @Override
    public List<EmployeeCheck> selectAllHasCheckInEmployee(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllHasCheckInEmployee(pagination);
        
        for (int i = 0;i < list.size();i++) {
            list.get(i).setEc_ext5(3);
        }
        
        return list;
    }

    @Override
    public Integer selectAllHasCheckInEmployeeCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllHasCheckInEmployeeCount(pagination);
        
        return i;
    }

    @Override
    public List<EmployeeCheck> selectAllHasCheckOutEmployee(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllHasCheckOutEmployee(pagination);
        
        for (int i = 0;i < list.size();i++) {
            list.get(i).setEc_ext5(4);
        }
        
        return list;
    }

    @Override
    public Integer selectAllHasCheckOutEmployeeCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllHasCheckOutEmployeeCount(pagination);
        
        return i;
    }
    
}
