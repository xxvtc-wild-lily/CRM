package com.ysd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ysd.service.SignInService;
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
}
