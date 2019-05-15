package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Pagination;
import com.ysd.entity.Student;
import com.ysd.service.StudentService;
@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private Pagination<Student> pagination;
	@RequestMapping(value="/selectStudent",method=RequestMethod.POST)
	@ResponseBody
	public Pagination<Student> selectStudent(Integer rows,Integer page,Student student){
		pagination.setPage((page-1)*rows);
		pagination.setPageSize(rows);
		pagination.setStudent(student);
		pagination=studentService.selectStudentAll(pagination);		
		return pagination;
	} 
	@RequestMapping(value="/insertStudent",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertStudent(Student student) {
		return studentService.insertStudent(student);
	}
	@RequestMapping(value="/deleteStudent",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteStudent(Integer s_id) {
		return studentService.deleteStudent(s_id);
		
	}
}
