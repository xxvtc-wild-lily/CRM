package com.ysd.util;

import java.util.Locale;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringContextUtil implements ApplicationContextAware {
	 private static ApplicationContext context = null;
	 /* (non Javadoc)
	     * @Title: setApplicationContext
	     * @Description: spring获取bean工具类
	     * @param applicationContext
	     * @throws BeansException
	     * @see org.springframework.context.ApplicationContextAware#setApplicationContext(org.springframework.context.ApplicationContext)
	     */
	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		// TODO Auto-generated method stub
		this.context = arg0;
	}
	public static <T>  T getBean(String beanName){
        return (T) context.getBean(beanName);
    }
	public static String getMessage(String key){
        return context.getMessage(key, null, Locale.getDefault());
    }
}
