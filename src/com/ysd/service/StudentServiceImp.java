package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.StudentMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
@Service
public class StudentServiceImp implements StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	
	@Override
	public Fenye<Student> selectStudentAll(Fenye<Student> fenye) {
		List<Student> selectStudentAll = studentMapper.selectStudentAll(fenye);
		Integer selectStudentCount = studentMapper.selectStudentCount(fenye);
		fenye.setTotal(selectStudentCount);
		fenye.setRows(selectStudentAll);
		return fenye;
	}

	@Override
	public Integer insertStudent(Student student) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer deleteStudent(Integer s_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer updateStudent(Student student) {
		// TODO Auto-generated method stub
		return null;
	}

}
