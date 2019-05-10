package com.ysd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    
    // 登录的方法
    @RequestMapping(value="/signin",method=RequestMethod.POST)
    public String signin(Model model,HttpServletRequest request,Employee employee) {
        
        // 处理传过来的登录名、密码
        employee.setE_loginName(request.getParameter("e_loginName"));
        employee.setE_passWord(request.getParameter("e_passWord"));
        // 处理传过来的验证码数据以及拿到后台生成的验证码用来比对
        HttpSession session =request.getSession();
        String verificationCode = (String)session.getAttribute("randomcode_key");
        String verifyCode = request.getParameter("verifyCode");
        
        // 距离账号锁定剩余的机会
        Integer lastLoginChance = 3;
        
        // 验证验证码是否输入正确
        if(verifyCode.equalsIgnoreCase(verificationCode)){
        
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
                // 查询加密过的密码是否是该用户数据库里存入的密码
                Integer j = signInService.selectIsPasswordRight(employee);
                
                // 如果大于0则说明密码正确
                if (j > 0) {
                    
                    // 查询用户是否锁定
                    Integer isLock = signInService.selectIsEmployeeLockOut(employee);
                    
                    // 如果大于0就是已锁定
                    if (isLock > 0) {
                        // 设置提示信息为该账号已锁定
                        model.addAttribute("msg","该账号已锁定！");
                    } else {
                        // 没有锁定的判断
                        
                        // 设置最后登录时间为当前时间
                        signInService.updateLastLoginTime(employee);
                        // 登陆成功后将错误次数归零
                        signInService.updatePwdWrongTimeWhenSuccess(employee);
                        
                        return "redirect:index.jsp";
                    }
                    
                } else {
                    
                    // 密码错误后更改错误次数
                    signInService.updatePwdWrongTime(employee);
                    // 查询目前的错误次数
                    lastLoginChance = signInService.selectPwdWrongTime(employee);
                    // 获取剩下的尝试机会
                    lastLoginChance = 3-lastLoginChance;
                    
                    // 设置提示信息为密码错误，并提示剩余尝试次数
                    model.addAttribute("msg","密码错误，剩余尝试次数："+lastLoginChance);
                    // 如果错误次数等于3次，就锁定账户
                    if (lastLoginChance == 0) {
                        // 修改锁定状态为锁定，修改锁定时间为当前时间
                        signInService.updateEmployeeIsLockOut(employee);
                        model.addAttribute("msg","该账号已锁定！");
                    } else if (lastLoginChance < 0) {
                        // 超过3次尝试次数
                        model.addAttribute("msg","该账号已锁定！");
                    }
                    
                }
                
            } else {
                // 没有找到相同的用户名
                model.addAttribute("msg","用户名不存在！");
            }
            
        }else{
            // 验证码输入错误进入此判断
            model.addAttribute("msg","验证码输入错误！");
        }
        
        return "signin";
    }
}
