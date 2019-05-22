package com.ysd.util;

import java.net.URLEncoder;

import com.ysd.util.Config;
import com.ysd.util.HttpUtil;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String to = "";
	private static String smsContent = "";

	/**
	 * 验证码通知短信
	 */
	public static void execute()
	{
		String tmpSmsContent = null;
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    System.out.println("result:" + System.getProperty("line.separator") + result);
	}

	public static String getOperation() {
		return operation;
	}

	public static void setOperation(String operation) {
		IndustrySMS.operation = operation;
	}

	public static String getAccountSid() {
		return accountSid;
	}

	public static void setAccountSid(String accountSid) {
		IndustrySMS.accountSid = accountSid;
	}

	public static String getTo() {
		return to;
	}

	public static void setTo(String to) {
		IndustrySMS.to = to;
	}

	public static String getSmsContent() {
		return smsContent;
	}

	public static void setSmsContent(String smsContent) {
		IndustrySMS.smsContent = smsContent;
	}
	
	
	
}
