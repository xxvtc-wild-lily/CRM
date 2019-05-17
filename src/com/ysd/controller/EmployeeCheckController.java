package com.ysd.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

@Controller
public class EmployeeCheckController {
    
    @Autowired
    private EmployeeCheckService employeeCheckService;
    
    @Autowired
    private RegisterService registerService;
    
    @Autowired
    private EmployeeCheck employeeCheck;
    
    @RequestMapping(value="/init",method=RequestMethod.POST)
    @ResponseBody
    public Pagination<EmployeeCheck> init(@RequestParam(value="rows") Integer pageSize,@RequestParam(value="page") Integer page,Pagination<EmployeeCheck> pagination){
        
        List<EmployeeCheck> list = new ArrayList<EmployeeCheck>();
        Integer i = 0;
        
        pagination.setPageSize(pageSize);
        pagination.setPage((page-1)*pagination.getPageSize());
        
        if (pagination.getEc_checkStatus() == null) {
            list = employeeCheckService.selectAllEmployeeCheckA(pagination);
            i = employeeCheckService.selectAllEmployeeCheckCountA(pagination);
        } else {
            list = employeeCheckService.selectAllEmployeeCheckB(pagination);
            i = employeeCheckService.selectAllEmployeeCheckCountB(pagination);
        }
        
        
        
        pagination.setRows(list);
        pagination.setTotal(i);
        
        System.out.println(pagination.getRows().toString());
        
        return pagination;
    }
    
}
