package com.ysd.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Employee;
import com.ysd.entity.EmployeeCheck;
import com.ysd.service.RegisterService;

@Controller
public class RegisterController {
    
    @Autowired
    private RegisterService registerService;
    
    @Autowired
    private EmployeeCheck employeeCheck;
    
    @RequestMapping(value="/register",method=RequestMethod.POST)
    @ResponseBody
    public Integer register(Employee employee) {
        
        // 判断当前签到状态的状态码
        Integer statusCode = 0;
        
        // 声明事件相关的方法
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        
        // 获取当前日期的0时
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date zero = calendar.getTime();
        String ec_checkInTime = format.format(zero);
        
        // 获取当前日期的22时
        calendar.set(Calendar.HOUR_OF_DAY, 22);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date TwentyTwo = calendar.getTime();
        String ec_checkOutTime = format.format(TwentyTwo);
        
        // 获取当前时间
        Date date = new Date();
        String now = format.format(date);
        
        // 赋值给签到类
        String e_name = employee.getE_loginName();
        employeeCheck.setE_name(e_name);
        employeeCheck.setEc_checkInTime(ec_checkInTime);
        employeeCheck.setEc_checkOutTime(ec_checkOutTime);
        
        // 查询今天是否已经签到的方法
        Integer isTodayCheckIn = registerService.selectIsTodayHaveCheckIn(employeeCheck);
        
        // 如果等于0说明今天没签到
        if (isTodayCheckIn == 0) {
            // 判断当前时间是否在今天0时至晚22时
            if (zero.getTime() <= date.getTime() && date.getTime() <= TwentyTwo.getTime()) {
                // 添加用户签到记录
                Integer j = registerService.insertEmployeeCheck(employee);
                // 如果大于0签到成功
                if (j > 0) {
                    statusCode = 3;
                } else {
                    statusCode = 4;
                }
            } else {
                // 不在规定的签到时间内进入此判断
                statusCode = 2;
            }
        } else {
            // 进入此判断说明已经签到了
            statusCode = 1;
        }
        
        return statusCode;
    }
    
    
    @RequestMapping(value="/signBack",method=RequestMethod.POST)
    @ResponseBody
    public Integer signBack(Employee employee) {
        
        // 判断当前签到状态的状态码
        Integer statusCode = 0;
        
        // 声明事件相关的方法
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        
        // 获取当前日期的0时
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date zero = calendar.getTime();
        String ec_checkInTime = format.format(zero);
        
        // 获取当前时间晚18时
        calendar.set(Calendar.HOUR_OF_DAY, 18);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date Eighteen = calendar.getTime();
        String ec_checkOutTime18 = format.format(Eighteen);
        
        // 获取当前日期的22时
        calendar.set(Calendar.HOUR_OF_DAY, 22);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date TwentyTwo = calendar.getTime();
        String ec_checkOutTime22 = format.format(TwentyTwo);
        
        // 获取当前时间
        Date date = new Date();
        String now = format.format(date);
        
        // 赋值给签到类
        String e_name = employee.getE_loginName();
        employeeCheck.setE_name(e_name);
        employeeCheck.setEc_checkInTime(ec_checkInTime);
        employeeCheck.setEc_checkOutTime(ec_checkOutTime22);
        
        // 查询今天是否已经签到的方法
        Integer isTodayCheckIn = registerService.selectIsTodayHaveCheckIn(employeeCheck);
        // 不等于0说明已经签到了
        if (isTodayCheckIn != 0) {
            // 查询今天是否已经签退
            Integer isTodayCheckOut = registerService.selectIsTodayHaveCheckOut(employeeCheck);
            // 没有查询到说明还未签退
            if (isTodayCheckOut == 0) {
                //如果大于晚6点并且小于晚10点才能签退
                if (Eighteen.getTime() > date.getTime() && date.getTime() < TwentyTwo.getTime()) {
                    // 修改今天的签到记录，加上签退时间
                    Integer j = registerService.updateEmployeeCheck(employee);
                    // 如果大于0就修改成功
                    if (j > 0) {
                        statusCode = 4;
                    } else {
                        // 修改失败的判断
                        statusCode = 5;
                    }
                } else {
                    // 当前不在签退时间的判断
                    statusCode = 3;
                }
            } else {
                // 已经签退的判断
                statusCode = 2;
            }
            
        } else {
            // 今天尚未签到的判断
            statusCode = 1;
        }
        
        
        
        
        return statusCode;
    }
    
}
