package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.service.StudentService;
@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private Fenye<Student> fenye;
	@RequestMapping(value="/selectStudent",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> selectStudent(Integer rows,Integer page,Student student){
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye.setStudent(student);
		fenye=studentService.selectStudentAll(fenye);		
		return fenye;
	} 
	
}
