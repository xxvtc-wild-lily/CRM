package com.ysd.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspsmart.upload.Request;
import com.ysd.dao.EmployeeMapper;
import com.ysd.entity.Asker;
import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeRole;
import com.ysd.entity.Pagination;
import com.ysd.entity.Role;
@Service
public class EmployeeServiceImp implements EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private Asker asker;
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
    public Integer insertRoleForEmployee(String arr,EmployeeRole employeeRole,String e_name,String r_name) {
        // TODO Auto-generated method stub
        
    	String[] ridArr = arr.split(",");
    	String[] rname=r_name.split(",");
	    Integer code = 0;
	    for (int i = 0;i < ridArr.length;i++) {
	    	if(rname[i].equals("咨询师") || rname[i].equals("网络咨询师")) {
	    		employeeRole.setR_id(Integer.parseInt(ridArr[i]));
	    		asker.setA_name(e_name);
	    		asker.setA_roleName(rname[i]);
	    		employeeMapper.addAsker(asker);
		        code=employeeMapper.insertRoleForEmployee(employeeRole);
	    	}else {
	    		employeeRole.setR_id(Integer.parseInt(ridArr[i]));
	    		code=employeeMapper.insertRoleForEmployee(employeeRole);
	    	}
	    }

        return code;
    }


    @Override
    public Integer deleteRoleForEmployee(String arr,EmployeeRole employeeRole,String r_name,String name) {
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
    			 if(rname[i].equals("网络咨询师")) {
    				 employeeMapper.deleteAskerByName(name, rname[i]);
    				 employeeRole.setR_id(Integer.parseInt(ridArr[i])); 
        			 coun=employeeMapper.deleteRoleForEmployee(employeeRole);
    			 }else {
    				 employeeRole.setR_id(Integer.parseInt(ridArr[i])); 
        			 coun=employeeMapper.deleteRoleForEmployee(employeeRole);
    			 }
    		 }
    	 }else {
    		 for(int i = 0;i < rname.length;i++) {
    			 if(rname[i].equals("咨询师")) { 
   				  Integer selectGenJinStudentCountById =employeeMapper.selectGenJinStudentCountById(employeeRole.getE_id());
   				  	if(selectGenJinStudentCountById>0){ 
   					  coun= 0; 
   				  	}else{
   				  	employeeMapper.deleteAskerByName(name, rname[i]);
   				  	employeeRole.setR_id(Integer.parseInt(ridArr[i])); 
   				  	coun= employeeMapper.deleteRoleForEmployee(employeeRole);
   				  	}
    			 }else {
    				 if(rname[i].equals("网络咨询师")) {
    					 employeeMapper.deleteAskerByName(name, rname[i]);
    					 employeeRole.setR_id(Integer.parseInt(ridArr[i])); 
    	       	    	 employeeMapper.deleteRoleForEmployee(employeeRole);
    				 }else {
    					 employeeRole.setR_id(Integer.parseInt(ridArr[i])); 
    	       	    	 employeeMapper.deleteRoleForEmployee(employeeRole);
    				 }
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


	@Override
	public List selectTongJiTu(String e_loginName) {
		String selectRoleByEmpName = employeeMapper.selectRoleByEmpName(e_loginName);
		List list=new ArrayList();
		if(selectRoleByEmpName.equals("管理员")) {
			Integer selectSuoDingCount = employeeMapper.selectSuoDingCount();
			Integer selectWeiSuoDingCount = employeeMapper.selectWeiSuoDingCount();
			list.add(selectSuoDingCount);
			list.add(selectWeiSuoDingCount);
			list.add(selectRoleByEmpName);
		}else if(selectRoleByEmpName.equals("咨询经理")){
			Integer selectWeiQianDaoRenShu = employeeMapper.selectWeiQianDaoRenShu();
			Integer selectQianDaoRenShu = employeeMapper.selectQianDaoRenShu();
			list.add(selectWeiQianDaoRenShu);
			list.add(selectQianDaoRenShu);
			list.add(selectRoleByEmpName);
		}else if(selectRoleByEmpName.equals("咨询师")) {
			Integer selectStudentByEmpName = employeeMapper.selectStudentByEmpName(e_loginName);
			Integer selectStudentLuiShiByEmpName = employeeMapper.selectStudentLuiShiByEmpName(e_loginName);
			Integer selectStudentLuRuByEmpName = employeeMapper.selectStudentLuRuByEmpName(e_loginName);
			Integer genjin=selectStudentByEmpName-selectStudentLuiShiByEmpName-selectStudentLuRuByEmpName;
			list.add(selectStudentLuiShiByEmpName);
			list.add(selectStudentLuRuByEmpName);
			list.add(selectRoleByEmpName);
			list.add(genjin);
		}else if(selectRoleByEmpName.equals("网络咨询师")) {
			Integer selectStudentAddByEmpName = employeeMapper.selectStudentAddByEmpName(e_loginName);
			Integer selectStudentAddLiuShuByEmpName = employeeMapper.selectStudentAddLiuShuByEmpName(e_loginName);
			Integer selectStudentAddLuRuByEmpName = employeeMapper.selectStudentAddLuRuByEmpName(e_loginName);
			Integer genjin=selectStudentAddByEmpName-selectStudentAddLiuShuByEmpName-selectStudentAddLuRuByEmpName;
			list.add(selectStudentAddLiuShuByEmpName);
			list.add(selectStudentAddLuRuByEmpName);
			list.add(selectRoleByEmpName);
			list.add(genjin);
		}
		return list;
			
		
		
	}
    
}
