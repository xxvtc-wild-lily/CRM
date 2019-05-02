package com.ysd.service;

import com.ysd.entity.Employee;

public interface SignUpService {
	/**
	 * 查询是否有名称相同的员工图片
	 * @param e_photo 传过来用来对比的员工图片名
	 * @return 受影响的行数
	 */
	Integer selectIsHaveSameEmployeePhotoName(String e_photo);
	
	/**
	 * 添加注册的员工
	 * @param employee 传过来的员工信息
	 * @return 受影响的行数
	 */
	Integer insertSignUpEmployee(Employee employee);
	
	/**
	 * 查询是否有相同的登录名
	 * @param e_loginName 前台传过来的登录名
	 * @return 查询到的行数
	 */
	Integer selectIsHaveSameLoginName(String e_loginName);
}
