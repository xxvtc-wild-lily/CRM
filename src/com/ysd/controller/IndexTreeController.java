package com.ysd.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Employee;
import com.ysd.service.IndexTreeService;
import com.ysd.service.MyThread;
import com.ysd.util.IndexTree;
import com.ysd.util.IndustrySMS;
import com.ysd.util.PasswordUtil;

@Controller
public class IndexTreeController {
    
    @Autowired
    private IndexTree indexTree;
    
    @Autowired
    private IndexTreeService indexTreeService;
    
    @RequestMapping(value="/initTree",method=RequestMethod.POST)
    @ResponseBody
    public List<HashMap<String, Object>> initTree(Employee employee) {
        
        List<HashMap<String, Object>> tree = indexTree.getTree(employee);
       
        return tree;
    }
    
    @RequestMapping(value="/safeSignOut",method=RequestMethod.POST)
    @ResponseBody
    public String safeSignOut(HttpServletRequest request,HttpServletResponse response,Employee employee) {
        
        request.getSession().invalidate();
        
        Cookie[] cookies=request.getCookies();
        
        for(Cookie cookie: cookies){
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
        }
        
        return "1";
    }
    
    @RequestMapping(value="/getPhoneNumber",method=RequestMethod.POST)
    @ResponseBody
    public String getPhoneNumber(Employee employee) {
        
        String phoneNumber = indexTreeService.selectProtectMTelByLoginName(employee);
        
        return phoneNumber;
    }
    
    
    @RequestMapping(value="/getRandomCode",method=RequestMethod.POST)
    @ResponseBody
    public Integer randomCode(String phoneNumber) {
        
        System.out.println(phoneNumber);
        
        //生成六位随机数验证码
        int randomCode=(int)((Math.random()*9+1)*100000);
        
        System.out.println(randomCode);
        
        //将电话号赋给短信发送的工具类
        IndustrySMS.setTo(phoneNumber);
        
        String smsContent="【云时代】您的验证码为"+randomCode+"，请于30分钟内正确输入，如非本人操作，请忽略此短信。";
        
        System.out.println(smsContent);
        
        //将短信内容赋给短信发送的工具类
        IndustrySMS.setSmsContent(smsContent);
        
        //执行发送短信的方法
        IndustrySMS.execute();
        
        return randomCode;
    }
    
    @RequestMapping(value="/checkOldPassword",method=RequestMethod.POST)
    @ResponseBody
    public Integer checkOldPassword(Employee employee) {
        
        // 根据登录名获取用户的指纹码
        String e_fingerprintNum = indexTreeService.selectFingerprintNumByLoginName(employee);
        // 根据用户数入的密码和获取到的指纹码生成MD5加密的密码
        String e_passWord = PasswordUtil.generate(employee.getE_passWord(), e_fingerprintNum);
        // 将密码赋如员工类
        employee.setE_passWord(e_passWord);
        
        Integer i = indexTreeService.selectIsOldPasswordSame(employee);
        
        return i;
    }
    
    @RequestMapping(value="/updatePassword",method=RequestMethod.POST)
    @ResponseBody
    public Integer updatePassword(Employee employee) {
        
        // 根据登录名获取用户的指纹码
        String e_fingerprintNum = indexTreeService.selectFingerprintNumByLoginName(employee);
        // 根据用户数入的密码和获取到的指纹码生成MD5加密的密码
        String e_passWord = PasswordUtil.generate(employee.getE_passWord(), e_fingerprintNum);
        // 将密码赋如员工类
        employee.setE_passWord(e_passWord);
        
        Integer i = indexTreeService.updatePasswordByLoginName(employee);
        
        return i;
    }
    
    @RequestMapping(value="/returnIndex",method=RequestMethod.POST)
    @ResponseBody
    public void returnIndex(HttpServletRequest request,HttpServletResponse response) {
        
        request.getSession().invalidate();
        
        Cookie[] cookies=request.getCookies();
        
        for(Cookie cookie: cookies){
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
        }
        
    }
}
