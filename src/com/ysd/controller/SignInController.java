package com.ysd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ysd.entity.Employee;
import com.ysd.service.SignInService;
import com.ysd.util.PasswordUtil;
import com.ysd.util.RandomValidateCode;

@Controller
public class SignInController {
	
	@Autowired
	private SignInService signInService;
	
	// 获取生成验证码显示到 UI 界面
    @RequestMapping(value="/checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        
        // 设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            // 输出图片方法
            randomValidateCode.getRandcode(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // 判断验证码是否正确
    @RequestMapping("/verifiAction")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        HttpSession session =request.getSession();
        String verificationCode = (String)session.getAttribute("randomcode_key");
        String verifyCode = request.getParameter("verifyCode");
        PrintWriter out = response.getWriter();
        // equalsIgnoreCase可以不区分大小写
        if(verifyCode.equalsIgnoreCase(verificationCode)){
            // 正确输出1
            out.println(1);
        }else{
            // 错误输出0
            out.println(0);
        }
        out.flush();
        out.close();
    }
    
    // 登录的方法
    @RequestMapping(value="/signin",method=RequestMethod.POST)
    @ResponseBody
    public String signin(Integer checkStatus,Employee employee) {
        
        // 登录状态码
        Integer loginStatusCode = 0;
        // 距离账号锁定剩余的机会
        Integer lastLoginChance = 3;
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        Gson gson = new Gson();
        
        // 没有勾选记住密码在这个判断里执行
            
        // 查询是存在相同登录名的员工
        Integer i = signInService.selectIsHaveSameLoginName(employee);
        // 如果等于1则存在该登录名的用户
        if (i == 1) {
                
            // 根据登录名获取用户的指纹码
            String e_fingerprintNum = signInService.selectFingerprintNumByLoginName(employee);
            // 根据用户数入的密码和获取到的指纹码生成MD5加密的密码
            String e_passWord = PasswordUtil.generate(employee.getE_passWord(), e_fingerprintNum);
            // 将密码赋如员工类
            employee.setE_passWord(e_passWord);
            System.out.println(employee.toString());
            // 查询加密过的密码是否是该用户数据库里存入的密码
            Integer j = signInService.selectIsPasswordRight(employee);
            
            // 如果大于0则说明密码正确
            if (j > 0) {
                
                // 查询用户是否锁定
                Integer isLock = signInService.selectIsEmployeeLockOut(employee);
                
                // 如果大于0就是已锁定
                if (isLock > 0) {
                    loginStatusCode = 4;
                } else {
                    // 没有锁定的判断
                    
                    // 登陆成功后将登录状态码设置成1
                    loginStatusCode = 1;
                    // 设置最后登录时间为当前时间
                    Integer updateLastLoginTime = signInService.updateLastLoginTime(employee);
                }
                
            } else {
                
                // 密码错误后更改错误次数
                Integer k = signInService.updatePwdWrongTime(employee);
                // 查询目前的错误次数
                lastLoginChance = signInService.selectPwdWrongTime(employee);
                // 获取剩下的尝试机会
                lastLoginChance = 3-lastLoginChance;
                loginStatusCode = 3;
                // 如果错误次数等于3次，就锁定账户
                if (lastLoginChance == 0) {
                    // 修改锁定状态为锁定，修改锁定时间为当前时间
                    Integer lockEmployee = signInService.updateEmployeeIsLockOut(employee);
                    loginStatusCode = 4;
                } else if (lastLoginChance < 0) {
                    // 如果错过三次还在尝试就设置状态码为4，以避免登录错误次数为3还提示还剩余尝试次数
                    loginStatusCode = 4;
                }
                
            }
            
        } else {
            // 没有找到相同的用户名
            loginStatusCode = 2;
        }
        
        map.put("loginStatusCode",loginStatusCode);
        map.put("lastLoginChance",lastLoginChance);
        
        String json =gson.toJson(map);
        
        return json;
    }
}
