package com.ysd.service;


import com.ysd.entity.Pagination;
import com.ysd.entity.Student;
public interface StudentService {
	Pagination<Student> selectStudentAll(Pagination<Student> pagination);
	
	Integer insertStudent(Student student);
	
	Integer deleteStudent(Integer s_id);
	
	Integer updateStudent(Student student);
	
}
