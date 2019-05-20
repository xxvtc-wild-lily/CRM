package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Asker;
import com.ysd.entity.Employee;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;

public interface DistributionMapper {
    
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
     * 根据权重倒序查找所有签到的咨询师
     * @return 查询到的咨询师list集合
     */
    List<Asker> selectAllChcekInAsker();
    
    /**
     * 查询所有未分配的学生
     * @return 查询到的学生list集合
     */
    List<Student> selectNotDistributionStudent();
    
    /**
     * 查询所有今天签到的咨询师已分配并且有效的学生数量
     * @param aid 咨询师的id
     * @return 查询出的学生总数
     */
    Integer selectAllHasDistributionStudentCountByAid(Integer aid);
    
    /**
     * 查询所有已签到的咨询师的权重
     * @param aid 咨询师的id
     * @return 查询出的签到的员工的权重
     */
    Integer selectAllCheckInAskerWeight(Integer aid);
    
    /**
     * 给学生分配咨询师id
     * @param student 包含修改信息的学生类
     * @return 受影响的行数
     */
    Integer updateStduentAid(Student student);
    
    /**
     * 查询数据库是否拥有开关状态
     * @return 受影响的行数
     */
    Integer selectIsHaveStatus();
    
    /**
     * 向数据库里添加开关状态
     * @return 受影响的行数
     */
    Integer insertStatus();
    
    /**
     * 更改开关状态为开启
     * @return 受影响的行数
     */
    Integer updateStatus();
    
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
    
}
