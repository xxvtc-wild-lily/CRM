package com.ysd.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    
    @RequestMapping(value="/safeSignOut",method=RequestMethod.POST)
    @ResponseBody
    public String safeSignOut(HttpServletRequest request,HttpServletResponse response) {
        
        request.getSession().invalidate();
        
        Cookie[] cookies=request.getCookies();

        for(Cookie cookie: cookies){
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
        }
        
        return "1";
    }
}
