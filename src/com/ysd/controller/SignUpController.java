package com.ysd.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
			String e_protectEmail,String e_protectMTel,String e_sex,String e_age) throws IllegalStateException, IOException {
		
		// 设置前台用来判断的判断值
		Integer statusNum = 0;
		
		Integer isSame = signUpService.selectIsHaveSameLoginName(e_loginName);
		
		// 判断是否有重名的
		if (isSame==0) {
			// 判断保存路径
			String filePath = "D:\\GithubRepository\\CRM\\WebContent\\image";
			// 拿到图片名
			String fileName = file.getOriginalFilename();
			// 给图片重起一个名字
			String newFileName = UUID.randomUUID()+fileName;
			// 判断是否有重名图片
			Integer i=signUpService.selectIsHaveSameEmployeePhotoName(newFileName);
			// 如果没有就进入该判断，将图片保存到本地
			if (i<1) {
				// 生成File对象
				File targetFile = new File(filePath,newFileName);
				// 保存到本地
				file.transferTo(targetFile);
				
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
				
				if (j > 0) {
					statusNum = 0;
				} else {
					statusNum = 2;
				}
			} else {
				statusNum = 1;
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
		
		Integer i=0;
		
		Integer isSame = signUpService.selectIsHaveSameLoginName(employee.getE_loginName());
		
		// 判断是否有重名的
		if (isSame==0) {
			i = signUpService.insertSignUpEmployee(employee);
		} else {
			i = -1;
		}
		
		return i;
	}
	
}
