package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.DistributionMapper;
import com.ysd.entity.Pagination;
import com.ysd.entity.Student;

@Service
public class DistributionServiceImpl implements DistributionService {
    
    @Autowired
    private DistributionMapper distributionMapper;

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
    
}
