package com.ysd.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.EmployeeCheckMapper;
import com.ysd.dao.RegisterMapper;
import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeCheck;
import com.ysd.entity.Pagination;
import com.ysd.util.RegisterTime;

@Service
public class EmployeeCheckServiceImpl implements EmployeeCheckService {
    
    @Autowired
    private EmployeeCheckMapper employeeCheckMapper;
    
    @Autowired
    private EmployeeCheck employeeCheck;
    
    @Autowired
    private RegisterMapper registerMapper;
    
    @Autowired
    private RegisterTime registerTime;

    @Override
    public List<EmployeeCheck> selectAllEmployeeCheck(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllEmployeeCheck(pagination);
        
        for (int i = 0;i < list.size();i++) {
            list.get(i).setEc_ext5(1);
        }
        
        return list;
    }

    @Override
    public Integer selectAllEmployeeCheckCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllEmployeeCheckCount(pagination);
        
        return i;
    }

    @Override
    public List<EmployeeCheck> selectAllNotCheckEmployee(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllNotCheckEmployee(pagination);
        
        for (int i = 0;i < list.size();i++) {
            list.get(i).setEc_ext5(2);
        }
        
        return list;
    }

    @Override
    public Integer selectAllNotCheckEmployeeCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllNotCheckEmployeeCount(pagination);
        
        return i;
    }

    @Override
    public List<EmployeeCheck> selectAllHasCheckInEmployee(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllHasCheckInEmployee(pagination);
        
        for (int i = 0;i < list.size();i++) {
            list.get(i).setEc_ext5(3);
        }
        
        return list;
    }

    @Override
    public Integer selectAllHasCheckInEmployeeCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllHasCheckInEmployeeCount(pagination);
        
        return i;
    }

    @Override
    public List<EmployeeCheck> selectAllHasCheckOutEmployee(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        List<EmployeeCheck> list = employeeCheckMapper.selectAllHasCheckOutEmployee(pagination);
        
        for (int i = 0;i < list.size();i++) {
            list.get(i).setEc_ext5(4);
        }
        
        return list;
    }

    @Override
    public Integer selectAllHasCheckOutEmployeeCount(Pagination<EmployeeCheck> pagination) {
        // TODO Auto-generated method stub
        
        Integer i = employeeCheckMapper.selectAllHasCheckOutEmployeeCount(pagination);
        
        return i;
    }
    
    @Override
    public Integer updateEmployeeCheck(Employee employee) {
        // TODO Auto-generated method stub
        
        // 判断当前签到状态的状态码
        Integer statusCode = 0;
        
        // 获取今天0点的字符串类型数据
        String stringZero = registerTime.getStringTime(0);
        // 获取今天0点的日期类型数据
        Date dateZero = registerTime.getDateTime(0);
        // 获取今天18点的字符串类型数据
        String stringTen = registerTime.getStringTime(18);
        // 获取今天18点的日期类型数据
        Date dateTen = registerTime.getDateTime(18);
        // 获取今天22点的字符串类型数据
        String stringTwentyTwo = registerTime.getStringTime(22);
        // 获取今天22点的日期类型数据
        Date dateTwentyTwo = registerTime.getDateTime(22);
        // 获取今天24点的字符串类型数据
        String stringTwentyFour = registerTime.getStringTime(24);
        // 获取今天24点的日期类型数据
        Date dateTwentyFour = registerTime.getDateTime(24);
        // 获取现在时间的字符串类型数据
        String stringNow = registerTime.getNowString();
        // 获取现在时间的日期类型数据
        Date dateNow = registerTime.getNowDate();
        
        // 赋值给签到类
        String e_name = employee.getE_loginName();
        employeeCheck.setE_name(e_name);
        employeeCheck.setEc_checkInTime(stringZero);
        employeeCheck.setEc_checkOutTime(stringTwentyFour);
        
        // 查询今天是否签到
        Integer isTodayCheckIn = registerMapper.selectIsTodayHaveCheckIn(employeeCheck);
        
        // 不等于0说明已经签到了
        if (isTodayCheckIn != 0) {
            // 查询今天是否已经签退
            Integer isTodayCheckOut  = registerMapper.selectIsTodayHaveCheckOut(employeeCheck);
            // 如果等于0说明没有签退
            if (isTodayCheckOut == 0) {
                // 修改用户签退时间
                Integer i = registerMapper.updateEmployeeCheck(employeeCheck);
                // 修改用户表里的签到状态
                registerMapper.updateEmployeeCheckOutStatus(employee);
                // 修改签到表里的签到状态
                registerMapper.updateEmployeeCheckCheckOutStatus(employeeCheck);
                // 查询当前用户是存在于咨询师表里，即是否是咨询师
                Integer isAsker = registerMapper.selectIsAsker(employee);
                System.out.println("================"+isAsker);
                if (isAsker != null && isAsker != 0 && !isAsker.equals("null")) {
                    // 更改签退时间
                    registerMapper.updateAskerCheckOutTime(employee);
                    // 更改签退状态
                    registerMapper.updateAskerCheckOutStatus(employee);
                }
                // 如果大于0则修改成功
                if (i > 0) {
                    statusCode = 4;
                } else {
                    statusCode = 5;
                }
            } else {
                statusCode = 2;
            }
        } else {
            statusCode = 1;
        }
        
        return statusCode;
    }
    
}
