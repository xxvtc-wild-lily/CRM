package com.ysd.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ysd.entity.Employee;
import com.ysd.service.SignInService;
import com.ysd.util.IndustrySMS;
import com.ysd.util.PasswordUtil;
import com.ysd.util.RandomValidateCode;

@Controller
public class SignInController {
    
    @Autowired
    private SignInService signInService;
    
    @RequestMapping(value="/inDistribution",method=RequestMethod.GET)
    public String inDistribution() {
        return "view/distribution";
    }
    
    @RequestMapping(value="/inEmployee",method=RequestMethod.GET)
    public String inEmployee() {
        return "view/employee";
    }
    
    @RequestMapping(value="/inEmployeeDelete",method=RequestMethod.GET)
    public String inEmployeeDelete() {
        return "view/employeeDelete";
    }
    
    @RequestMapping(value="/inEmployeeInfo",method=RequestMethod.GET)
    public String inEmployeeInfo() {
        return "view/employeeInfo";
    }
    
    @RequestMapping(value="/inEmployeeRegister",method=RequestMethod.GET)
    public String inEmployeeRegister() {
        return "view/employeeRegister";
    }
    
    @RequestMapping(value="/inEmployeeWorkLog",method=RequestMethod.GET)
    public String inEmployeeWorkLog() {
        return "view/employeeWorkLog";
    }
    
    @RequestMapping(value="/inIndex",method=RequestMethod.GET)
    public String inIndex() {
        return "view/index";
    }
    
    @RequestMapping(value="/inModule",method=RequestMethod.GET)
    public String inModule() {
        return "view/module";
    }
    
    @RequestMapping(value="/inNetFollow",method=RequestMethod.GET)
    public String inNetFollow() {
        return "view/NetFollow";
    }
    
    @RequestMapping(value="/inrole",method=RequestMethod.GET)
    public String inrole() {
        return "view/role";
    }
    
    @RequestMapping(value="/inSignin",method=RequestMethod.GET)
    public String inSignin() {
        return "view/signin";
    }
    
    @RequestMapping(value="/inSignup",method=RequestMethod.GET)
    public String inSignup() {
        return "view/signup";
    }
    
    @RequestMapping(value="/inStudent",method=RequestMethod.GET)
    public String inStudent() {
        return "view/student";
    }
    
    @RequestMapping(value="/inStudentAdd",method=RequestMethod.GET)
    public String inStudentAdd() {
        return "view/studentAdd";
    }
    
    @RequestMapping(value="/inStudentDelete",method=RequestMethod.GET)
    public String inStudentDelete() {
        return "view/studentDelete";
    }
    
    @RequestMapping(value="/inStudentUpdate",method=RequestMethod.GET)
    public String inStudentUpdate() {
        return "view/studentUpdate";
    }
    
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
    
    @RequestMapping(value="/toSignin",method=RequestMethod.GET)
    public String toSignin(Model model,HttpServletRequest request,HttpServletResponse response,Employee employee) {
        return "/view/signin";
    }
    
    // 登录的方法
    @RequestMapping(value="/signin",method=RequestMethod.POST)
    @ResponseBody
    public String signin(HttpServletRequest request,HttpServletResponse response,Employee employee) {
        
        // 传回去的状态码
        Integer statusCode = 0;
        
        // 处理传过来的登录名、密码
        employee.setE_loginName(request.getParameter("e_loginName"));
        employee.setE_passWord(request.getParameter("e_passWord"));
        // 处理传过来的验证码数据以及拿到后台生成的验证码用来比对
        HttpSession session =request.getSession();
        String verificationCode = (String)session.getAttribute("randomcode_key");
        String verifyCode = request.getParameter("verifyCode");
        // 获取是否记住密码的值
        String passLogin = request.getParameter("passLogin");
        
        // 距离账号锁定剩余的机会
        Integer lastLoginChance = 3;
        
        // 验证验证码是否输入正确
        if(verifyCode.equalsIgnoreCase(verificationCode)){

            // 查询是存在相同登录名的员工
            Integer i = signInService.selectIsHaveSameLoginName(employee);
            // 如果等于1则存在该登录名的用户
            if (i == 1) {
                
                // 声明application
                ServletContext application = request.getServletContext();
                
                // 如果application中存在此用户名则不能登录
                if (application.getAttribute(employee.getE_loginName()) != null && application.getAttribute(employee.getE_loginName()).equals(employee.getE_loginName())) {
                    
                    statusCode = 7;
                    
                } else {
                    // 如果用户目前没有被别人登录就接着进行下面的判断
                    
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
                            statusCode = 4;
                        } else {
                            // 没有锁定的判断
                            
                            // 设置最后登录时间为当前时间
                            signInService.updateLastLoginTime(employee);
                            // 登陆成功后将错误次数归零
                            signInService.updatePwdWrongTimeWhenSuccess(employee);
                            
                            // 判断是否将用户名密码赋给cookie的操作
                            System.out.println("passLogin========"+passLogin);
                            if (passLogin.equals("true")) {
                                // 记住密码
                                
                                // 把账号存入Cookie且名字为loginName
                                Cookie loginName = new Cookie("loginName", employee.getE_loginName());
                                // 设置过期时间（以秒为单位）
                                loginName.setMaxAge(60 * 60 * 24 * 7);
                                // 设置添加到根路径下
                                loginName.setPath("/");
                                //添加Cookie
                                response.addCookie(loginName);
                            }
                            // 拿到用户的e_id
                            Integer e_id = signInService.selectEidByloginName(employee);
                            // 放入用户类
                            employee.setE_id(e_id);
                            // 将登录信息赋到session里
                            session.setAttribute("employee",employee);
                            
                            // 将用户名放入application中
                            application.setAttribute(employee.getE_loginName(),employee.getE_loginName());
                            
                            statusCode = 1;
                            }
                        } else {
                            // 密码错误进入这里
                            
                            // 查询当前用户是否为管理员
                            String r_name = signInService.selectIsAdmin(employee);
                            // 如果为管理员就只提示密码错误
                            if (r_name != null && r_name.equals("管理员")) {
                                statusCode = 6;
                            } else {
                                // 如果不是管理员就更改错误次数
                                
                                // 密码错误后更改错误次数
                                signInService.updatePwdWrongTime(employee);
                                // 查询目前的错误次数
                                lastLoginChance = signInService.selectPwdWrongTime(employee);
                                // 获取剩下的尝试机会
                                lastLoginChance = 3-lastLoginChance;
                                
                                // 设置提示信息为密码错误，并提示剩余尝试次数
                                statusCode = 3;
                                // 如果错误次数等于3次，就锁定账户
                                if (lastLoginChance == 0) {
                                    // 修改锁定状态为锁定，修改锁定时间为当前时间
                                    signInService.updateEmployeeIsLockOut(employee);
                                    statusCode = 4;
                                } else if (lastLoginChance < 0) {
                                    // 超过3次尝试次数
                                    statusCode = 4;
                                }
                            
                            }
                        }
                    
                }
                
            } else {
                // 没有找到相同的用户名
                statusCode = 2;
            }
            
        }else{
            // 验证码输入错误进入此判断
            statusCode = 5;
        }
        
        String res = "{"+"loginStatusCode:"+statusCode+","+"lastLoginChance:"+lastLoginChance+"}";
        
        return res;
    }
    
    @RequestMapping(value="errorClose",method=RequestMethod.POST)
    public void errorClose(HttpServletRequest request,Employee employee) {
        // 声明application
        ServletContext application = request.getServletContext();
        
        // 判断当前用户名是否还存在
        if (application.getAttribute(employee.getE_loginName()) != null && application.getAttribute(employee.getE_loginName()).equals(employee.getE_loginName())) {
            // 从application中移除当前用户
            application.removeAttribute(employee.getE_loginName());
        }
        
    }
    
}
