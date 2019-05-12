package com.ysd.service;


import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
public interface StudentService {
	Fenye<Student> selectStudentAll(Fenye<Student> fenye);
	
	Integer insertStudent(Student student);
	
	Integer deleteStudent(Integer s_id);
	
	Integer updateStudent(Student student);
}
