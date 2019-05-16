package com.ysd.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.EmployeeCheck;
import com.ysd.entity.Pagination;
import com.ysd.service.EmployeeCheckService;

@Controller
public class EmployeeCheckController {
    
    @Autowired
    private EmployeeCheckService employeeCheckService;
    
    @RequestMapping(value="/init",method=RequestMethod.POST)
    @ResponseBody
    public Pagination<EmployeeCheck> init(@RequestParam(value="rows") Integer pageSize,@RequestParam(value="page") Integer page,Pagination<EmployeeCheck> pagination){
        pagination.setPageSize(pageSize);
        pagination.setPage((page-1)*pagination.getPageSize());
        
        List<EmployeeCheck> list = employeeCheckService.selectAllEmployeeCheck(pagination);
        Integer i = employeeCheckService.selectAllEmployeeCheckCount(pagination);
        
        pagination.setRows(list);
        pagination.setTotal(i);
        
        return pagination;
    }
}
