package com.ysd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Pagination;
import com.ysd.entity.Student;
import com.ysd.service.DistributionService;

@Controller
public class DistributionController {
    
    @Autowired
    private DistributionService distributionService;
    
    @RequestMapping(value="initDistributionTable",method=RequestMethod.POST)
    @ResponseBody
    public Pagination<Student> initTale(Integer rows,Integer pageSize,Pagination<Student> pagination) {
        
        pagination.setPageSize(rows);
        pagination.setPage((pagination.getPage()-1)*pagination.getPageSize());
        
        List<Student> list = distributionService.selectAllNotDistributionStudent(pagination);
        Integer i = distributionService.selectAllNotDistributionStudentCount(pagination);
        
        pagination.setRows(list);
        pagination.setTotal(i);
        
        return pagination;
    }
}
