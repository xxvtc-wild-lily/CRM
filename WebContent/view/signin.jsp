<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("path",request.getContextPath());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
    body{
        background:url('${path }/image/58799065d3db8.jpg')top center no-repeat;
        background-size:cover;
    }
</style>
<script type="text/javascript">
    $(function(){
    	//获取cookie的值
    	var loginName = getCookie("loginName");
    	var password = getCookie("password");
    	
    	// 当cookie有值才进行赋值操作
    	if (loginName != null && loginName != "" && loginName != undefined &&
    		password != null && password != "" && password != undefined) {
	    	$("#e_loginName").textbox("setValue",loginName);
	    	$("#e_passWord").passwordbox("setValue",password);
    	}
    })
    
    // 获取指定名称的cookie
    function getCookie(cookie_name) {
        var allcookies = document.cookie;
        //索引长度，开始索引的位置
        var cookie_pos = allcookies.indexOf(cookie_name);

        // 如果找到了索引，就代表cookie存在,否则不存在
        if (cookie_pos != -1) {
            // 把cookie_pos放在值的开始，只要给值加1即可
            //计算取cookie值得开始索引，加的1为“=”
            cookie_pos = cookie_pos + cookie_name.length + 1; 
            //计算取cookie值得结束索引
            var cookie_end = allcookies.indexOf(";", cookie_pos);
            
            if (cookie_end == -1) {
                cookie_end = allcookies.length;

            }
            //得到想要的cookie的值
            var value = unescape(allcookies.substring(cookie_pos, cookie_end)); 
        }
        return value;
    }
    
    // ajax登录的方法
    /* function signIn() {
    	var e_loginName = $("#e_loginName").val();
    	var e_passWord = $("#e_passWord").val();
    	var verifyCode = $("#verifyCode").val();
    	var passLogin = $("input[type='checkbox']").is(':checked');
    	// 是否记住密码的判断值
    	var checkStatus = 0;
    	// 获取验证码图片元素
        var verifyCodeImage = document.getElementById("verifyCodeImage");
    	
    	if (e_loginName != null && e_loginName != "" && e_loginName != undefined) {
    		if (e_passWord != null && e_passWord != "" && e_passWord != undefined) {
    			if (verifyCode != null && verifyCode != "" && verifyCode != undefined) {
    				// 验证图片验证码是否正确
    				$.post("verifiAction",{
    					verifyCode:verifyCode
    				},function(res){
    					if (res==1){
    						// 判断是否勾选7天免登录，赋值给勾选状态，然后传给后台进行判断
    						if (passLogin) {
    							checkStatus = 1;
    						} else {
    							checkStatus = 0;
    						}
    						// 登录的post提交
    						$.post("signin",{
    							e_loginName:e_loginName,
    							e_passWord:e_passWord,
    							checkStatus:checkStatus
    						},function (res) {
    							if (res.loginStatusCode == 1) {
    								$.messager.alert("提示","登陆成功！","info");
    							} else if (res.loginStatusCode == 2) {
    								$.messager.alert("提示","用户名不存在！","error");
    								verifyCodeImage.click();
    							} else if (res.loginStatusCode == 3) {
    								$.messager.alert("提示","密码错误，剩余尝试次数："+res.lastLoginChance,"error");
    								verifyCodeImage.click();
    							} else if (res.loginStatusCode == 4) {
    								$.messager.alert("提示","账号已锁定！","error");
    								verifyCodeImage.click();
    							}
    						},"json")
    						
    					} else {
    						$.messager.alert("提示","验证码错误，请重新输入！","error");
    						// 执行click以触发更换图片操作
    						verifyCodeImage.click();
    					}
    				},"json")
    				
    			} else {
    				$.messager.alert("提示","验证码不能为空！","error");
    			}
    		} else {
    			$.messager.alert("提示","密码不能为空！","error");
    		}
    	} else {
    		$.messager.alert("提示","用户名不能为空！","error");
    	}
    	
    } */
    
    function forgetPassword() {
    	alert("忘记密码");
    }
</script>
</head>
<body>
    <div style="width:600px;margin:150px 500px;">
	    <div class="easyui-panel" id="signInPanel" style="width:500px;height:300px;padding:10px;text-align:center;overflow:hidden;">
	        <span><h3>欢迎使用CRM客户管理系统</h3></span>
	        <form id="signInForm" action="${path }/signin" method="post">
	            <table id="signInTable" style="margin-top:30px;margin-left:90px;">
	                <tr>
	                    <td>登录名：</td>
	                    <td>
	                        <input type="text" class="easyui-textbox" name="e_loginName" id="e_loginName" data-options="iconCls:'icon-man'" />
	                    </td>
	                </tr>
	                <tr>
	                    <td>密码：</td>
	                    <td>
	                        <input type="text" class="easyui-passwordbox"  name="e_passWord" id="e_passWord" />
	                    </td>
	                </tr>
	                <tr>
                        <td align="right">
                            <img src="${path }/checkCode" width="110" height="34" id="verifyCodeImage" onclick="this.src=this.src+'?'">
                        </td>
                        <td>
                            <input type="text" class="easyui-textbox" id="verifyCode" name="verifyCode" prompt="请输入验证码" maxlength="4">
                        </td>
                    </tr>
	                <tr>
                        <td></td>
                        <td>
                            <input type="checkbox" class="easyui-tooltip" name="passLogin" id="passLogin" title="7天免登录"  style="margin-left:90px;margin-top:5px;" />记住我
                        </td>
                    </tr>
	            </table>
	            <div style="margin-left:40px;height:25px;">
	               <b>${msg }</b>
                </div>
	            <div style="margin-left:40px">
	               <input type="submit" id="signin" value="登录"/>
	            </div>
	            <!-- <div style="margin-left:140px;margin-top:20px;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-help'" onclick="forgetPassword()">忘记密码?</a>
                </div> -->
	        </form>
	    </div>
    </div>
</body>
</html>