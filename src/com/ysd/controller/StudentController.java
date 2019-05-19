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
	@Autowired
	private NetFollow netfollow;
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
	public Integer insertStudent(Student student,@RequestParam(value="isAutoAllot") boolean isAutoAllot) {
	    
	    Integer i = 0;
	    
	    // 判断是否自动分量
	    if(isAutoAllot) {
	        
	        
	        
	    } else {
	        i = studentService.insertStudent(student);
	    }
	    
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
	
	
	@RequestMapping(value="/insertNetFollow",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertNetFollow(Integer n_stuId,String n_stuName, String n_followTime, String n_nextFollowTime, String n_context,Integer e_id, String n_followType,String n_followStatus) {
		
		return studentService.insertNetFollow(netfollow);
		
	}
	
	
}
