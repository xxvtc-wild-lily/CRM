package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.DistributionMapper;
import com.ysd.dao.StudentMapper;
import com.ysd.entity.Asker;
import com.ysd.entity.Employee;
import com.ysd.entity.NetFollow;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;
@Service
public class StudentServiceImp implements StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	@Autowired
	private DistributionMapper distributionMapper;
	
	
	@Override
	public Pagination<Student> selectStudentAll(Pagination<Student> pagination) {
	    
	    Integer isAskerManager = studentMapper.selectIsAskerManager(pagination);
	    pagination.setA_aid(isAskerManager);
	    
	    System.out.println(isAskerManager+"=====================");
	    
	    if (isAskerManager != null && isAskerManager != 0 && !isAskerManager.equals("null")) {
	        
	        String askerRoleName = studentMapper.selectAskerRoleNameByAid(isAskerManager);
	        System.out.println(askerRoleName);
	        pagination.setE_importEmployee(askerRoleName);
	        
	        List<Student> list = studentMapper.selectStudentByRole(pagination);
	        Integer i = studentMapper.selectStudentCountByRole(pagination);
	        System.out.println("总人数=========================="+i);
	        pagination.setTotal(i);
            pagination.setRows(list);
	        
	    } else {
	        List<Student> selectStudentAll = studentMapper.selectStudentAll(pagination);
	        Integer selectStudentCount = studentMapper.selectStudentCount(pagination);
	        pagination.setTotal(selectStudentCount);
	        pagination.setRows(selectStudentAll);
	    }
	    
		
		return pagination;
	}

	@Override
	public Integer insertStudent(Student student) {
		// TODO Auto-generated method stub
	    
	    // 查询是否开启自动分量开关
	    Integer i = studentMapper.selectIsAutoDistributionOpen();
	    // 传回去的状态码
	    Integer status = 0;
	    
	    // 如果大于0则说明开启了自动分量开关
	    if (i > 0) {
	        
	        // 倒序查询所有今天签到的咨询师信息
	        List<Asker> askerList = distributionMapper.selectAllChcekInAsker();
	        // 已经分配并且有效的学生总数
            Integer validStudentCount = 0;
            // 循环查询今天签到的咨询师已分配并且有效的学生数
            for (int j = 0;j < askerList.size();j++) {
                validStudentCount += distributionMapper.selectAllHasDistributionStudentCountByAid(askerList.get(j).getA_id());
            }
            // 算出每个人已分配并且有效的学生平均数
            Integer studentCountAvg = validStudentCount / askerList.size();
            // 循环拿出已分配学生小于平均值的咨询师
            for (int l = 0;l < askerList.size();l++) {
                // 拿到本次循环的咨询师id
                Integer studentCount = distributionMapper.selectAllHasDistributionStudentCountByAid(askerList.get(l).getA_id());
                // 如果本次循环的咨询师id大于平均值就移除该咨询师
                if (studentCount > studentCountAvg) {
                    askerList.remove(l);
                }
            }
            // 将该学生分配给学生数量小于平均值并且权重最高的咨询师
            student.setS_askerId(askerList.get(0).getA_id());
            
            status = studentMapper.insertStudent(student);
	    } else {
	        status = studentMapper.insertStudent(student);
	    }
	    
	    
	    
		return status;
	}

	@Override
	public Integer deleteStudent(Integer s_id) {
		// TODO Auto-generated method stub
		return studentMapper.deleteStudent(s_id);
	}

	@Override
	public Integer updateStudent(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.updateStudent(student);
	}

	@Override
	public Integer insertNetFoll(NetFollow netfollow) {
		
		return studentMapper.insertNetFoll(netfollow);
	}


}
