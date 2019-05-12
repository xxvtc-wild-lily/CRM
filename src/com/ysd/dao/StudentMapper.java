package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentMapper {
	List<Student> selectStudentAll(Fenye<Student> fenye);
	
	Integer selectStudentCount(Fenye<Student> fenye);
	
	Integer insertStudent(Student student);
	
	Integer deleteStudent(Integer s_id);
	
	Integer updateStudent(Student student);
}
