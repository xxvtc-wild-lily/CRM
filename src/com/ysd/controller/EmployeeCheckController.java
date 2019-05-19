package com.ysd.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeCheck;
import com.ysd.entity.Pagination;
import com.ysd.service.EmployeeCheckService;
import com.ysd.service.RegisterService;
import com.ysd.util.RegisterTime;

@Controller
public class EmployeeCheckController {
    
    @Autowired
    private EmployeeCheckService employeeCheckService;
    
    @Autowired
    private RegisterService registerService;
    
    @Autowired
    private EmployeeCheck employeeCheck;
    
    @Autowired
    private RegisterTime registerTime;
    
    @RequestMapping(value="/init",method=RequestMethod.POST)
    @ResponseBody
    public Pagination<EmployeeCheck> init(@RequestParam(value="rows") Integer pageSize,@RequestParam(value="page") Integer page,Pagination<EmployeeCheck> pagination){
        
        List<EmployeeCheck> list = new ArrayList<EmployeeCheck>();
        Integer i = 0;
        
        pagination.setPageSize(pageSize);
        pagination.setPage((page-1)*pagination.getPageSize());
        
        if (pagination.getEc_checkStatus() == null) {
            // 默认的判断
            
            list = employeeCheckService.selectAllEmployeeCheck(pagination);
            i = employeeCheckService.selectAllEmployeeCheckCount(pagination);
            
        } else if (pagination.getEc_checkStatus() == 1) {
            // 已签到的判断
            
            // 为时间未填时设置时间
            if (pagination.getStartCheckInTime() == "" && pagination.getStartCheckInTime() == "") {
                pagination.setStartCheckInTime(registerTime.getStringTime(0));
                pagination.setEndCheckInTime(registerTime.getStringTime(24));
            }
            
            list = employeeCheckService.selectAllHasCheckInEmployee(pagination);
            i = employeeCheckService.selectAllHasCheckInEmployeeCount(pagination);
            
        } else if (pagination.getEc_checkStatus() == 2){
            // 以签退的判断
            
            list = employeeCheckService.selectAllHasCheckOutEmployee(pagination);
            i = employeeCheckService.selectAllHasCheckOutEmployeeCount(pagination);
            
        } else if (pagination.getEc_checkStatus() == 3) {
            // 未签到的判断
            
            // 为时间未填时设置时间
            if (pagination.getStartCheckInTime() == "" && pagination.getStartCheckInTime() == "") {
                pagination.setStartCheckInTime(registerTime.getStringTime(0));
                pagination.setEndCheckInTime(registerTime.getStringTime(24));
            }
            
            list = employeeCheckService.selectAllNotCheckEmployee(pagination);
            i = employeeCheckService.selectAllNotCheckEmployeeCount(pagination);
        }
        
        
        pagination.setRows(list);
        pagination.setTotal(i);
        
        System.out.println(pagination.getRows().toString());
        
        return pagination;
    }
    
    @RequestMapping(value="/signOut",method=RequestMethod.POST)
    @ResponseBody
    public Integer signBack(Employee employee) {
        
        Integer i = employeeCheckService.updateEmployeeCheck(employee);
        
        return i;
    }
    
}
