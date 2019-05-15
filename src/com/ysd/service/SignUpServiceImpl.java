package com.ysd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.SignUpMapper;
import com.ysd.entity.Employee;
import com.ysd.util.PasswordUtil;

@Service
public class SignUpServiceImpl implements SignUpService {
	
	@Autowired
	private SignUpMapper signUpMapper;
	
	public Integer selectIsHaveSameEmployeePhotoName(String e_photo) {
		
		Integer i=signUpMapper.selectIsHaveSameEmployeePhotoName(e_photo);
		
		return i;
	}

	@Override
	public Integer insertSignUpEmployee(Employee employee) {
		// TODO Auto-generated method stub
		
		String e_fingerprintNum="";
		Integer i=0;
		String e_passWord="";
		
		// 如果没有相同的指纹码就进行接下来的代码，如果有就循环
		do {
			e_fingerprintNum=PasswordUtil.randomFingerprintNumber();
			i=signUpMapper.selectIsHaveSameFingerprintNum(e_fingerprintNum);
			e_passWord=PasswordUtil.generate(employee.getE_passWord(), e_fingerprintNum);
		} while (i>0);
		
		employee.setE_fingerprintNum(e_fingerprintNum);
		employee.setE_passWord(e_passWord);
		
		Integer j = signUpMapper.insertSignUpEmployee(employee);
		
		return j;
	}

	@Override
	public Integer selectIsHaveSameLoginName(String e_loginName) {
		// TODO Auto-generated method stub
		
		Integer i = signUpMapper.selectIsHaveSameLoginName(e_loginName);
		
		return i;
	}
}
