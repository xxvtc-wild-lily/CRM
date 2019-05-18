package com.ysd.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 在传入时间数字时请传入24小时制数字，如：8，16，22
 * @author Sor3
 * 日期：2019.5.17
 */
@Component
public class RegisterTime {
    
    // 公共的处理类
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Calendar calendar = Calendar.getInstance();
    
    // 获取指定时间的字符串类型的方法
    public String getStringTime (Integer number) {
        
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, number);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date time = calendar.getTime();
        String stringTime = format.format(time);
        
        return stringTime;
    }
    
    // 获取指定时间的日期类型的方法
    public Date getDateTime (Integer number) {
        
        calendar.setTime(new Date());
        calendar.set(Calendar.HOUR_OF_DAY, number);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date dateTime = calendar.getTime();
       
        return dateTime;
    }
    
    // 获取日期类型当前时间的方法
    public Date getNowDate () {
        Date date = new Date();
        return date;
    }
    
    // 获取字符串类型当前时间的方法
    public String getNowString () {
        Date date = new Date();
        String stringDate = format.format(date);
        return stringDate;
    }
    
}
