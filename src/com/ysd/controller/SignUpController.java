package com.ysd.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ysd.entity.Employee;
import com.ysd.service.SignUpService;

@Controller
public class SignUpController {
	
	@Autowired
	private SignUpService signUpService;
	
	// 需要上传图片的注册方法
	@RequestMapping(value=("/insertSignUpEmployeeHaveImage"),method=RequestMethod.POST)
	@ResponseBody
	public Integer insertSignUpEmployeeHaveImage(@RequestParam(value=("e_photo")) MultipartFile file,String e_loginName,String e_passWord,
			String e_protectEmail,String e_protectMTel,String e_sex,String e_age,HttpServletRequest request) throws IllegalStateException, IOException {
		
		// 设置前台用来判断的判断值
		Integer statusNum = 0;
		// 查询用户名是否已使用
		Integer isSame = signUpService.selectIsHaveSameLoginName(e_loginName);
		// 查询手机号是否已使用
		Integer isSameProtectMTel = signUpService.selectIsHaveSameProtectMTel(e_protectMTel);
		// 查询邮箱是否已使用
		Integer isSameProtectEmail = signUpService.selectIsHaveSameProtectEmail(e_protectEmail);
		
		// 判断是否有重名的
		if (isSame == 0) {
		    if (isSameProtectMTel == 0) {
		        if (isSameProtectEmail == 0) {
		            // 获取Tomcat项目的绝对路径
		            String tomcatAbsolutePath = request.getSession().getServletContext().getRealPath("/image");
		            // 获取当前class文件的绝对路径
		            // String projectAbsolutePath = SignUpController.class.getClassLoader().getResource("").getPath();
		            // 拿到需要拼接的路径
		            // int end = projectAbsolutePath.length() - "bulid/classes/".length();
		            // 获取当前项目的路径
		            // projectAbsolutePath = projectAbsolutePath.substring(1, end);
		            // 拼接拿到当前项目image文件夹的绝对路径
		            // projectAbsolutePath += "/image";
        			// 拿到图片名
        			String fileName = file.getOriginalFilename();
        			// 给图片重起一个名字
        			String newFileName = UUID.randomUUID()+fileName;
        			// 判断是否有重名图片
        			Integer i=signUpService.selectIsHaveSameEmployeePhotoName(newFileName);
        			// 如果没有就进入该判断，将图片保存到本地
        			if (i<1) {
        				// 生成Tomcat的File对象
        				File tomcattFile = new File(tomcatAbsolutePath,newFileName);
        				// 生成项目image文件夹的File对象
        				// File importFile = new File(projectAbsolutePath,newFileName);
        				// 保存到Tomcat
        				file.transferTo(tomcattFile);
        				// 保存到项目image文件夹
        				// file.transferTo(importFile);
        			    
        			    // 被复制到此文件中
        			    // FileOutputStream tomcatOS = new FileOutputStream(new File(tomcatAbsolutePath+"\\"+newFileName));
        			    // FileCopyUtils.copy(file.getInputStream(),tomcatOS);
        			    
        			    // 被复制到此文件中
                        // FileOutputStream projectOS = new FileOutputStream(new File(projectAbsolutePath+"\\"+newFileName));
                        // FileCopyUtils.copy(file.getInputStream(),projectOS);
        			    
        				
        				// 创建一个employee对象来存放属性值
        				Employee employee = new Employee();
        				employee.setE_loginName(e_loginName);
        				employee.setE_passWord(e_passWord);
        				employee.setE_protectMTel(e_protectMTel);
        				employee.setE_protectEmail(e_protectEmail);
        				employee.setE_photo(newFileName);
        				// 判断两个Integer类型的值不能为空才赋值，否则不赋值
        				if (e_sex != null && !e_sex.equals("") && !e_sex.equals(" ") && !e_sex.equals("undefined")) {
        					employee.setE_sex(Integer.parseInt(e_sex));
        				}
        				if (e_age != null && !e_age.equals("") && !e_age.equals(" ") && !e_sex.equals("undefined")) {
        					employee.setE_age(Integer.parseInt(e_age));
        				}
        				
        				Integer j = signUpService.insertSignUpEmployee(employee);
        				
        				// 如果大于0就说明添加成功
        				if (j > 0) {
        					statusNum = 0;
        				} else {
        					statusNum = 2;
        				}
        			} else {
        				statusNum = 1;
        			}
		        } else {
		            statusNum = 5;
		        }
		    } else {
		        statusNum = 4;
		    }
		} else {
			statusNum = 3;
		}
		
		return statusNum;
	}
	
	// 不需要上传图片的注册方法
	@RequestMapping(value=("/insertSignUpEmployeeNotHaveImage"),method=RequestMethod.POST)
	@ResponseBody
	public Integer insertSignUpEmployeeNotHaveImage(Employee employee) throws IllegalStateException, IOException {
	    
	    // 设置前台用来判断的判断值
        Integer statusNum = 0;
		// 查询是否有相同的用户名
		Integer isSame = signUpService.selectIsHaveSameLoginName(employee.getE_loginName());
		// 查询手机号是否已使用
        Integer isSameProtectMTel = signUpService.selectIsHaveSameProtectMTel(employee.getE_protectMTel());
        // 查询邮箱是否已使用
        Integer isSameProtectEmail = signUpService.selectIsHaveSameProtectEmail(employee.getE_protectEmail());
		// 判断是否有重名的
		if (isSame == 0) {
		    if (isSameProtectMTel == 0) {
                if (isSameProtectEmail == 0) {
        			Integer i = signUpService.insertSignUpEmployee(employee);
        			
        			// 如果大于0就说明添加成功
        			if (i > 0) {
                        statusNum = 1;
                    } else {
                        statusNum = 2;
                    }
                } else {
                    statusNum = 5;
        		}
            } else {
                statusNum = 4;
            }
		} else {
		    statusNum = 3;
		}
		
		return statusNum;
	}
	
}
