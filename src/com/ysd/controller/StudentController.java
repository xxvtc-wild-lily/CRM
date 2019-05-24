package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.NetFollow;
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
	public Pagination<Student> selectStudent(Integer rows,Integer page,Student student,String e_loginName,String in_s_createTime,String en_s_createTime){
		pagination.setPage((page-1)*rows);
		pagination.setPageSize(rows);
		pagination.setStudent(student);
		pagination.setE_name(e_loginName);
		pagination.setIn_s_createTime(in_s_createTime);
		pagination.setEn_s_createTime(en_s_createTime);
		pagination=studentService.selectStudentAll(pagination);
		
		return pagination;
	} 
	@RequestMapping(value="/insertStudent",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertStudent(Student student,@RequestParam(value="isAutoAllot") boolean isAutoAllot) {
	    Integer i = studentService.insertStudent(student);
	    
		return i;
		// 
	}
	
	@RequestMapping(value="/deleteStudent",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteStudent(Integer s_id) {
		return studentService.deleteStudent(s_id);
		
	}
	@RequestMapping(value="/updateStudent",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateStudent(Student student) {
		
		return studentService.updateStudent(student);
		
	}
	
	

	@RequestMapping(value="/insertNetFoll",method=RequestMethod.POST)

	@ResponseBody
	public Integer insertNetFoll(NetFollow netfollow) {
		
		return studentService.insertNetFoll(netfollow);
		
	}
	
	
}
