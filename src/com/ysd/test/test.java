package com.ysd.test;

import javax.servlet.http.HttpServletRequest;

import com.ysd.controller.SignUpController;

public class test {
    public static void main(String[] args) {
        // 获取当前class文件的绝对路径
        String projectAbsolutePath = SignUpController.class.getResource("/").getPath();
        // 拿到需要拼接的路径
        int end = projectAbsolutePath.length() - "bulid/classes/".length();
        // 获取当前项目的路径
        projectAbsolutePath = projectAbsolutePath.substring(1, end);
        // 拼接拿到当前项目image文件夹的绝对路径
        projectAbsolutePath += "/image";
        System.out.println(projectAbsolutePath);
        // D:\apache-tomcat-8.5.37\wtpwebapps\CRM\WE\image\b62c4b22-dfe4-4ce2-a13d-6cdb5182e8fbu=765233379,2333674402&fm=26&gp=0.jpg (系统找不到指定的路径。)
    }
}
