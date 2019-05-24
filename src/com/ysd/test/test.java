package com.ysd.test;

import javax.servlet.http.HttpServletRequest;

import com.ysd.controller.SignUpController;

public class test {
    public static void main(String[] args) {
        // 获取当前class文件的绝对路径
        String projectAbsolutePath = SignUpController.class.getClassLoader().getResource("").getPath();
        // 拿到需要拼接的路径
        int end = projectAbsolutePath.length() - "bulid/classes/".length();
        // 获取当前项目import的路径
        projectAbsolutePath = projectAbsolutePath.substring(1, end);
        // 拼接拿到当前项目文件夹的绝对路径
        projectAbsolutePath += "WebContent/image";
        System.out.println(projectAbsolutePath);
    }
}
