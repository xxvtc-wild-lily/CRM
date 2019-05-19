package com.ysd.service;

import java.util.List;

import com.ysd.entity.Pagination;
import com.ysd.entity.Student;

public interface DistributionService {
    
    /**
     *分页查询所有未分配咨询师的学生
     * @param pagination 包含分页信息的分页类
     * @return 查询到的学生信息
     */
    List<Student> selectAllNotDistributionStudent(Pagination<Student> pagination);
    
    /**
     * 查询所有未分配的学生数量
     * @param pagination 包含分页信息的分页类
     * @return 查询到的条数
     */
    Integer selectAllNotDistributionStudentCount(Pagination<Student> pagination);
    
}
