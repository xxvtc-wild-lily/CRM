package com.ysd.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.RegisterMapper;
import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeCheck;
import com.ysd.util.RegisterTime;

@Service
public class RegisterServiceImpl implements RegisterService {
    
    @Autowired
    private RegisterMapper registerMapper;
    
    @Autowired
    private RegisterTime registerTime;
    
    @Autowired
    private EmployeeCheck employeeCheck;

    @Override
    public Integer insertEmployeeCheck(Employee employee) {
        // TODO Auto-generated method stub
        
        // 判断当前签到状态的状态码
        Integer statusCode = 0;
        
        // 获取今天0点的字符串类型数据
        String stringZero = registerTime.getStringTime(0);
        // 获取今天0点的日期类型数据
        Date dateZero = registerTime.getDateTime(0);
        // 获取今天10点的字符串类型数据
        String stringTen = registerTime.getStringTime(10);
        // 获取今天10点的日期类型数据
        Date dateTen = registerTime.getDateTime(10);
        // 获取今天24点的字符串类型数据
        String stringTwentyFour = registerTime.getStringTime(24);
        // 获取今天24点的日期类型数据
        Date dateTwentyFour = registerTime.getDateTime(24);
        // 获取当前时间的字符串类型数据
        String stringNow = registerTime.getNowString();
        // 获取当前时间的日期类型数据
        Date dateNow = registerTime.getNowDate();
        
        String e_name = employee.getE_loginName();
        employeeCheck.setE_name(e_name);
        employeeCheck.setEc_checkInTime(stringZero);
        employeeCheck.setEc_checkOutTime(stringTwentyFour);
        
        // 查询今天是否签到
        Integer isTodayCheckIn = registerMapper.selectIsTodayHaveCheckIn(employeeCheck);
        
        // 如果等于0说明今天没签到
        if (isTodayCheckIn == 0) {
            // 判断是否在今天早上10点以前打的卡  
            if (dateZero.getTime() < dateNow.getTime() && dateNow.getTime() < dateTen.getTime()) {
                // 添加用户签到表里的记录
                Integer i = registerMapper.insertEmployeeCheck(employee);
                // 修改用户表里的签到状态
                registerMapper.updateEmployeeCheckStatus(employee);
                // 查询当前用户是存在于咨询师表里，即是否是咨询师
                Integer isAsker = registerMapper.selectIsAsker(employee);
                if (isAsker != null && isAsker != 0 && !isAsker.equals("null")) {
                    // 更改签到时间
                    registerMapper.updateAskerCheckInTime(employee);
                    // 更改签到状态
                    registerMapper.updateAskerCheckInStatus(employee);
                }
                // 如果大于0则修改成功
                if (i > 0) {
                    statusCode = 3;
                } else {
                    statusCode = 4;
                }
            } else {
                statusCode = 2;
            }
        } else {
            statusCode = 1;
        }
        
        return statusCode;
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
                // 如果大于晚上6点才能签退
                if (dateTen.getTime() < dateNow.getTime() && dateNow.getTime() < dateTwentyTwo.getTime()) {
                    // 修改用户签退时间
                    Integer i = registerMapper.updateEmployeeCheck(employeeCheck);
                    // 修改用户表里的签到状态
                    registerMapper.updateEmployeeCheckOutStatus(employee);
                    // 修改签到表里的签到状态
                    registerMapper.updateEmployeeCheckCheckOutStatus(employeeCheck);
                    // 查询当前用户是存在于咨询师表里，即是否是咨询师
                    Integer isAsker = registerMapper.selectIsAsker(employee);
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
                    statusCode = 3;
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
