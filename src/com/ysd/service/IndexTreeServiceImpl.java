package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.IndexTreeMapper;
import com.ysd.entity.Employee;
import com.ysd.entity.Modules;

@Service
public class IndexTreeServiceImpl implements IndexTreeService {
    
    @Autowired
    private IndexTreeMapper IndexTreeMapper;

    @Override
    public List<Modules> selectEmployeeAllModules(Employee employee) {
        // TODO Auto-generated method stub
        
        List<Modules> list = IndexTreeMapper.selectEmployeeAllModules(employee);
        
        return list;
    }
}
