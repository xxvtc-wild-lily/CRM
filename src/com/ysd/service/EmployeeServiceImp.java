package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspsmart.upload.Request;
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
		Integer selectGenJinStudentCountById = employeeMapper.selectGenJinStudentCountById(e_id);
		if(selectGenJinStudentCountById>0) {
			return 0;
		}else {
			return employeeMapper.deleteEmployee(e_id);
		}
		
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


    @Override
    public Integer deleteRoleForEmployee(String arr,EmployeeRole employeeRole,String r_name) {
         String[] rname=r_name.split(",");
    	 String[] ridArr = arr.split(",");
		 Integer coun=0; 
    	 Integer sizes=0;
    	 for (int i = 0;i < ridArr.length;i++) {
    		 if(rname[i].equals("咨询师")) {
    			 sizes=sizes;
    		 }else {
    			 sizes+=1;
    		 }
    	 }
    	 if(sizes==ridArr.length) {
    		 for(int i = 0;i < ridArr.length;i++) {
    			 employeeRole.setR_id(Integer.parseInt(ridArr[i])); 
    			 coun=employeeMapper.deleteRoleForEmployee(employeeRole);
    		 }
    	 }else {
    		 for(int i = 0;i < rname.length;i++) {
    			 if(rname[i].equals("咨询师")) { 
    				 System.out.println(Integer.parseInt(ridArr[i]));
   				  Integer selectGenJinStudentCountById =employeeMapper.selectGenJinStudentCountById(employeeRole.getE_id());
   				  System.out.println(selectGenJinStudentCountById);
   				  	if(selectGenJinStudentCountById>0){ 
   					  coun= 0; 
   				  	}else{
   				  	employeeRole.setR_id(Integer.parseInt(ridArr[i])); 
   				  	coun= employeeMapper.deleteRoleForEmployee(employeeRole);
   				  	}
    			 }else {
       	    		employeeRole.setR_id(Integer.parseInt(ridArr[i])); 
       	    		employeeMapper.deleteRoleForEmployee(employeeRole);
    			 }
    	 }
    	}
			return coun;
         
    }


    @Override
    public Integer updateEmployeePassword(Employee employee) {
        // TODO Auto-generated method stub
        
        Integer i = employeeMapper.updateEmployeePassword(employee);
        
        return i;
    }


    @Override
    public String selectFingerprintNumByLoginName(Employee employee) {
        // TODO Auto-generated method stub
        
        String fingerprintNum = employeeMapper.selectFingerprintNumByLoginName(employee);
        
        return fingerprintNum;
    }


    @Override
    public Integer updateEmployeeLock(Employee employee) {
        // TODO Auto-generated method stub
        
        Integer i = employeeMapper.updateEmployeeLock(employee);
        
        return i;
    }


    @Override
    public Integer updateEmployeeUnLock(Employee employee) {
        // TODO Auto-generated method stub
        
        Integer i = employeeMapper.updateEmployeeUnLock(employee);
        
        return i;
    }
    
}
