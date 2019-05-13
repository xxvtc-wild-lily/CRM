package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Pagination;
import com.ysd.entity.Student;

public interface StudentMapper {
	List<Student> selectStudentAll(Pagination<Student> pagination);
	
	Integer selectStudentCount(Pagination<Student> pagination);
	
	Integer insertStudent(Student student);
	
	Integer deleteStudent(Integer s_id);
	
	Integer updateStudent(Student student);
}
