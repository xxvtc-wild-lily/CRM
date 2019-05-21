package com.ysd.service;

import java.util.List;

import com.ysd.entity.Asker;
import com.ysd.entity.Employee;
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
    
    /**
     * 自动分配所有未分配的学生
     * @param employee 包含员工信息的员工类
     * @return 受影响的行数
     */
    Integer updateAllNotDistributionStudent(Employee employee);
    
    /**
     * 查询自动分量开关目前状态
     * @return 查询到的开关状态
     */
    Integer selectStatus();
    
    /**
     * 更改开关状态为关闭
     * @return 受影响的行数
     */
    Integer updateStatusClose();
    
    /**
     * 跟据权重倒序查找所有今天已经签到的咨询师
     * @return 查询到的咨询师集合
     */
    List<Asker> selectAllAskerOrderByWeight();
    
    /**
     * 查询所有未分配的学生
     * @return 查询到的学生集合
     */
    List<Student> selectAllNotDistributionStudentB();
    
    /**
     * 为咨询师分配学生的方法
     * @param student 前台传过来的包含学生id和咨询师id的学生类
     * @return 受影响的行数
     */
    Integer updateStudentAskerId(Student student);
    
}
