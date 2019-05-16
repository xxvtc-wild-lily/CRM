package com.ysd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.RegisterMapper;
import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeCheck;

@Service
public class RegisterServiceImpl implements RegisterService {
    
    @Autowired
    private RegisterMapper registerMapper;

    @Override
    public Integer insertEmployeeCheck(Employee employee) {
        // TODO Auto-generated method stub
        
        Integer i = registerMapper.insertEmployeeCheck(employee);
        
        return i;
    }

    @Override
    public Integer selectIsTodayHaveCheckIn(EmployeeCheck employeeCheck) {
        // TODO Auto-generated method stub
        
        Integer i = registerMapper.selectIsTodayHaveCheckIn(employeeCheck);
        
        return i;
    }

    @Override
    public Integer selectIsTodayHaveCheckOut(EmployeeCheck employeeCheck) {
        // TODO Auto-generated method stub
        
        Integer i = registerMapper.selectIsTodayHaveCheckOut(employeeCheck);
        
        return i;
    }

    @Override
    public Integer updateEmployeeCheck(Employee employee) {
        // TODO Auto-generated method stub
        
        Integer i = registerMapper.updateEmployeeCheck(employee);
        
        return i;
    }
}
