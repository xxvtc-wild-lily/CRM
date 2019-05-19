package com.ysd.dao;

import java.util.List;

import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;

public interface StudentMapper {
	List<Student> selectStudentAll(Pagination<Student> pagination);
	
	Integer selectStudentCount(Pagination<Student> pagination);
	
	Integer insertStudent(Student student);
	
	Integer deleteStudent(Integer s_id);
	
	Integer updateStudent(Student student);
	/**
	 * 添加一条跟踪记录
	 * @param netfollow
	 * @return
	 */
	Integer insertNetFollow(NetFollow netfollow);
	
	/**
	 * 查询是不是咨询经理
	 * @param student 包含查询信息的分页类
	 * @return 查询到的咨询师id
	 */
	Integer selectIsAskerManager(Pagination<Student> student);
	
	/**
	 * 跟据咨询师id查询角色名
	 * @param aid 查询到的咨询师id
	 * @return 查询到的角色名
	 */
	String selectAskerRoleNameByAid(Integer aid);
	
	/**
	 * 判断咨询师和网络咨询师来分别显示学生
	 * @param pagination 包含查询信息的分页类
	 * @return 查询到的学生信息
	 */
	List<Student> selectStudentByRole(Pagination<Student> pagination);
	
	/**
	 * 判断咨询师和网络咨询师来分别显示学生数量
	 * @param pagination 包含查询信息的分页类
	 * @return 查询到的学生数量
	 */
	Integer selectStudentCountByRole(Pagination<Student> pagination);
}
