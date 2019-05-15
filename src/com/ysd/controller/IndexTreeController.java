package com.ysd.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Employee;
import com.ysd.util.IndexTree;

@Controller
public class IndexTreeController {
    
    @Autowired
    private IndexTree indexTree;
    
    @RequestMapping(value="/initTree",method=RequestMethod.POST)
    @ResponseBody
    public List<HashMap<String, Object>> initTree(Employee employee) {
        
        List<HashMap<String, Object>> tree = indexTree.getTree(employee);
        
        return tree;
    }
}
