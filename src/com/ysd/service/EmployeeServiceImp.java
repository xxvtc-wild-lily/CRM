package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.EmployeeMapper;
import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;
@Service
public class EmployeeServiceImp implements EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Override
	public Pagination<Employee> selectEmployeeAll(Pagination<Employee> pagination) {
		List<Employee> selectEmployeeAll = employeeMapper.selectEmployeeAll(pagination);
		Integer selectEmployeeCount = employeeMapper.selectEmployeeCount(pagination);
		pagination.setRows(selectEmployeeAll);
		pagination.setTotal(selectEmployeeCount);
		return pagination;
	}


	@Override
	public Integer deleteEmployee(Integer e_id) {
		// TODO Auto-generated method stub
		return employeeMapper.deleteEmployee(e_id);
	}

	@Override
	public Integer updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		return employeeMapper.updateEmployee(employee);
	}


    @Override
    public List<Role> selectAllRole() {
        // TODO Auto-generated method stub
        
        List<Role> list = employeeMapper.selectAllRole();
        
        return list;
    }


    @Override
    public List<Role> selectEmployeeRoleByName(Employee employee) {
        // TODO Auto-generated method stub
        
        List<Role> list = employeeMapper.selectEmployeeRoleByName(employee);
        
        return list;
    }


    @Override
    public Integer insertRoleForEmployee(EmployeeRole employeeRole) {
        // TODO Auto-generated method stub
        
        Integer i = employeeMapper.insertRoleForEmployee(employeeRole);
        
        return i;
    }
    
}
