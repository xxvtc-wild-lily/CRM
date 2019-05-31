package com.ysd.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Asker;
import com.ysd.entity.Employee;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;
import com.ysd.service.DistributionService;

@Controller
public class DistributionController {
    
    @Autowired
    private DistributionService distributionService;
    
    @RequestMapping(value="/initDistributionTable",method=RequestMethod.POST)
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
    
    @RequestMapping(value="/distributionStudent",method=RequestMethod.POST)
    @ResponseBody
    public Integer distributionStudent(Employee employee) {
        
        Integer i = distributionService.updateAllNotDistributionStudent(employee);
        
        return i;
    }
    
    @RequestMapping(value="/closedDistributionStudent",method=RequestMethod.POST)
    @ResponseBody
    public Integer closedDistributionStudent(Employee employee) {
        
        Integer i = distributionService.updateStatusClose();
        
        return null;
    }
    
    @RequestMapping(value="/selectIsOpenAuto",method=RequestMethod.POST)
    @ResponseBody
    public Integer selectIsOpenAuto(Employee employee) {
        
        Integer i = distributionService.selectStatus();
        
        return i;
    }
    
    @RequestMapping(value="/getAllAsker",method=RequestMethod.POST)
    @ResponseBody
    public List<Asker> getAllAsker(Employee employee) {
        
        List<Asker> list = distributionService.selectAllAskerOrderByWeight();
        
        return list;
    }
    
    @RequestMapping(value="/allNotDistributionStudent",method=RequestMethod.POST)
    @ResponseBody
    public List<Student> allNotDistributionStudent(Employee employee) {
        
        List<Student> list = distributionService.selectAllNotDistributionStudentB();
        
        return list;
    }
    
    @RequestMapping(value="/handDistributionStudent",method=RequestMethod.POST)
    @ResponseBody
    public Integer handDistributionStudent(Student student,String studentIdArr,String a_name,String s_name,String e_loginName) {
        
        // 获取传过来的学生id
        String[] arr = studentIdArr.split(",");
        // 初始化状态码
        Integer i = 0;
        // 循环放入集合中
        for (int j = 0;j < arr.length;j++) {
            student.setS_id(Integer.parseInt(arr[j]));
            i = distributionService.updateStudentAskerId(student);
            //添加消息
            String p=e_loginName+","+a_name+","+s_name+"学生已经分配给你了，快去跟进。";
            WebSocketServlet websocket=new WebSocketServlet();
    		websocket.onMessage(p);
        }
        
        return i;
    }
    
    @RequestMapping(value="/checkInAskerCount",method=RequestMethod.POST)
    @ResponseBody
    public Integer checkInAskerCount(Student student,String studentIdArr) {
        
        Integer i = distributionService.selectAllCheckInAskerCount();
        
        return i;
    }
    
}
