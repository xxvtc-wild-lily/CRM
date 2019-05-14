package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.IndexTreeMapper;
import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Modules;
import com.ysd.entity.RoleModules;

@Service
public class IndexTreeServiceImpl implements IndexTreeService {
    
    @Autowired
    private IndexTreeMapper indexTreeMapper;

    @Override
    public List<EmployeeRole> selectAllRoleByLoginName(Employee employee) {
        // TODO Auto-generated method stub
        
        List<EmployeeRole> list = indexTreeMapper.selectAllRoleByLoginName(employee);
        
        return list;
    }

    @Override
    public List<RoleModules> selectAllRoleModulesByRoleId(Integer r_id) {
        // TODO Auto-generated method stub
        
        List<RoleModules> list = indexTreeMapper.selectAllRoleModulesByRoleId(r_id);
        
        return list;
    }

    @Override
    public Modules selectAllModulesByMid(Integer m_id) {
        // TODO Auto-generated method stub
        
        Modules list = indexTreeMapper.selectAllModulesByMid(m_id);
        
        return list;
    }
    
}
