package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.StudentMapper;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;
@Service
public class StudentServiceImp implements StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	
	@Override
	public Pagination<Student> selectStudentAll(Pagination<Student> pagination) {
		List<Student> selectStudentAll = studentMapper.selectStudentAll(pagination);
		Integer selectStudentCount = studentMapper.selectStudentCount(pagination);
		pagination.setTotal(selectStudentCount);
		pagination.setRows(selectStudentAll);
		return pagination;
	}

	@Override
	public Integer insertStudent(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.insertStudent(student);
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
