package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.DistributionMapper;
import com.ysd.entity.Asker;
import com.ysd.entity.Employee;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;

@Service
public class DistributionServiceImpl implements DistributionService {
    
    @Autowired
    private DistributionMapper distributionMapper;
    
    @Autowired
    private Student student;

    @Override
    public List<Student> selectAllNotDistributionStudent(Pagination<Student> pagination) {
        // TODO Auto-generated method stub
        
        List<Student> list = distributionMapper.selectAllNotDistributionStudent(pagination);
        
        return list;
    }

    @Override
    public Integer selectAllNotDistributionStudentCount(Pagination<Student> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = distributionMapper.selectAllNotDistributionStudentCount(pagination);
        
        return i;
    }

    @Override
    public Integer updateAllNotDistributionStudent(Employee employee) {
        // TODO Auto-generated method stub
        
        // 倒序查询所有今天签到的咨询师信息
        List<Asker> askerList = distributionMapper.selectAllChcekInAsker();
        // 查询所有未分配的学生
        List<Student> studentList = distributionMapper.selectNotDistributionStudent();
        // 跳出判断的变量
        Integer breakTimes = 0;
        // 如果学生数量大于咨询师数量就按权重的从大到小顺序分配
        if (studentList.size() >= askerList.size()) {
            // 循环添加学生
            for (int i = 0;i < studentList.size();i++) {
                // 当做咨询师id的变量
                breakTimes++;
                // 如果当前咨询师id变量等于咨询师长度，就进行归零，防止id不是查出来的id
                if (breakTimes == askerList.size()) {
                    breakTimes = 0;
                }
                // 为学生分配咨询师
                student.setS_askerId(askerList.get(breakTimes).getA_id());
                student.setS_id(studentList.get(i).getS_id());
                distributionMapper.updateStduentAid(student);
            }
            // 判断数据库里是否有自动分量的开关数据
            Integer i = distributionMapper.selectIsHaveStatus();
            // 如果大于0就说明有该条数据
            if (i > 0) {
                // 有的话就修改自动分量的开关数据
                distributionMapper.updateStatus();
            } else {
                // 没有就添加自动分量的开关数据
                distributionMapper.insertStatus();
            }
        } else if (studentList.size() != 0) {
            // 学生数量小于咨询师数量且不等于0的判断
            
            // 已经分配并且有效的学生总数
            Integer validStudentCount = 0;
            // 循环查询今天签到的咨询师已分配并且有效的学生数
            for (int i = 0;i < askerList.size();i++) {
                validStudentCount += distributionMapper.selectAllHasDistributionStudentCountByAid(askerList.get(i).getA_id());
            }
            // 算出每个人已分配并且有效的学生平均数
            Integer studentCountAvg = validStudentCount / askerList.size();
            // 循环拿出已分配学生小于平均值的咨询师
            for (int i = 0;i < askerList.size();i++) {
                // 拿到本次循环的咨询师id
                Integer studentCount = distributionMapper.selectAllHasDistributionStudentCountByAid(askerList.get(i).getA_id());
                // 如果本次循环的咨询师id大于平均值就移除该咨询师
                if (studentCount > studentCountAvg) {
                    askerList.remove(i);
                }
            }
            // 如果目前的学生数量大于咨询师数量就依靠权重进行分配
            if (studentList.size() > askerList.size()) {
                // 跳出判断的变量
                Integer breakTimes2 = 0;
                // 循环添加学生
                for (int i = 0;i < studentList.size();i++) {
                    // 当做咨询师id的变量
                    breakTimes2++;
                    // 如果当前咨询师id变量等于咨询师长度，就进行归零，防止id不是查出来的id
                    if (breakTimes2 == askerList.size()) {
                        breakTimes2 = 0;
                    }
                    // 为学生分配咨询师
                    student.setS_askerId(askerList.get(breakTimes2).getA_id());
                    student.setS_id(studentList.get(i).getS_id());
                    distributionMapper.updateStduentAid(student);
                }
                // 判断数据库里是否有自动分量的开关数据
                Integer i = distributionMapper.selectIsHaveStatus();
                // 如果大于0就说明有该条数据
                if (i > 0) {
                    // 有的话就修改自动分量的开关数据
                    distributionMapper.updateStatus();
                } else {
                    // 没有就添加自动分量的开关数据
                    distributionMapper.insertStatus();
                }
            } else if (studentList.size() != 0) {
                // 跳出判断的变量
                Integer breakTimes3 = 0;
                // 如果学生数量小于咨询师进行此判断
                for (int i = 0;i < askerList.size();i++) {
                    // 当做咨询师id的变量
                    breakTimes3++;
                    // 如果当前咨询师id变量等于咨询师长度，就进行归零，防止id不是查出来的id
                    if (breakTimes3 == askerList.size()) {
                        breakTimes3 = 0;
                    }
                    // 为学生分配咨询师
                    student.setS_askerId(askerList.get(i).getA_id());
                    student.setS_id(studentList.get(breakTimes3).getS_id());
                    distributionMapper.updateStduentAid(student);
                }
                // 判断数据库里是否有自动分量的开关数据
                Integer i = distributionMapper.selectIsHaveStatus();
                // 如果大于0就说明有该条数据
                if (i > 0) {
                    // 有的话就修改自动分量的开关数据
                    distributionMapper.updateStatus();
                } else {
                    // 没有就添加自动分量的开关数据
                    distributionMapper.insertStatus();
                }
            }
        } else {
            // 学生数量等于0的判断
            
            // 判断数据库里是否有自动分量的开关数据
            Integer i = distributionMapper.selectIsHaveStatus();
            // 如果大于0就说明有该条数据
            if (i > 0) {
                // 有的话就修改自动分量的开关数据
                distributionMapper.updateStatus();
            } else {
                // 没有就添加自动分量的开关数据
                distributionMapper.insertStatus();
            }
        }
        
        return null;
    }

    @Override
    public Integer selectStatus() {
        // TODO Auto-generated method stub
        
        Integer i = distributionMapper.selectStatus();
        
        return i;
    }

    @Override
    public Integer updateStatusClose() {
        // TODO Auto-generated method stub
        
        Integer i = distributionMapper.updateStatusClose();
        
        return i;
    }

    @Override
    public List<Asker> selectAllAskerOrderByWeight() {
        // TODO Auto-generated method stub
        
        List<Asker> list = distributionMapper.selectAllAskerOrderByWeight();
        
        return list;
    }

    @Override
    public List<Student> selectAllNotDistributionStudentB() {
        // TODO Auto-generated method stub
        
        List<Student> list = distributionMapper.selectAllNotDistributionStudentB();
        
        return list;
    }

    @Override
    public Integer updateStudentAskerId(Student student) {
        // TODO Auto-generated method stub
        
        Integer i = distributionMapper.updateStudentAskerId(student);
        
        return i;
    }
    
}
