<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="js/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" href="js/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
    body{
        background: url('image/58799065d3db8.jpg')top center no-repeat; 
        background-size:cover;
    }
</style>
<script type="text/javascript">
    $(function(){
    	
    })
    
    // 登录的方法
    function signIn() {
    	var e_loginName = $("#e_loginName").val();
    	var e_passWord = $("#e_passWord").val();
    	var verifyCode = $("#verifyCode").val();
    	var passLogin = $("input[type='checkbox']").is(':checked');
    	
    	if(e_loginName != null && e_loginName != "" && e_loginName != undefined) {
    		if(e_passWord != null && e_passWord != "" && e_passWord != undefined) {
    			if(verifyCode != null && verifyCode != "" && verifyCode != undefined) {
    				// 验证图片验证码是否正确
    				$.post("verifiAction",{
    					verifyCode:verifyCode
    				},function(res){
    					if(res==1){
    						// 判断是否勾选7天免登录
    						if(passLogin) {
    							
    						}
    					}else{
    						$.messager.alert("提示","验证码错误，请重新输入！","error");
    						// 获取验证码图片元素
    						var verifyCodeImage = document.getElementById("verifyCodeImage");
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
    	
    }
    
    function forgetPassword() {
    	alert("忘记密码");
    }
</script>
</head>
<body>
    <div style="width:600px;margin:150px 500px;">
	    <div class="easyui-panel" id="signInPanel" style="width:500px;height:300px;padding:10px;text-align:center;overflow:hidden;">
	        <span><h3>欢迎使用CRM客户管理系统</h3></span>
	        <form id="signInForm">
	            <table id="signInTable" style="margin:30px auto;">
	                <tr>
	                    <td>登录名：</td>
	                    <td>
	                        <input type="text" class="easyui-textbox" id="e_loginName" data-options="iconCls:'icon-man'" />
	                    </td>
	                </tr>
	                <tr>
	                    <td>密码：</td>
	                    <td>
	                        <input type="text" class="easyui-passwordbox" id="e_passWord" />
	                    </td>
	                </tr>
	                <tr>
                        <td align="right">
                            <img src="checkCode" width="110" height="34" id="verifyCodeImage" onclick="this.src=this.src+'?'">
                        </td>
                        <td>
                            <input class="easyui-textbox" type="text" id="verifyCode" name="verifyCode" prompt="请输入验证码" maxlength="4">
                        </td>
                    </tr>
	                <tr>
                        <td></td>
                        <td>
                            <input type="checkbox" class="easyui-tooltip" id="passLogin" title="7天免登录"  style="margin-left:90px;margin-top:5px;" />记住我
                        </td>
                    </tr>
	            </table>
	            <div style="margin-left:60px;">
	                <a href="javascript:void(0);" type="button" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="signIn()">登录</a>
	            </div>
	            <!-- <div style="margin-left:140px;margin-top:20px;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-help'" onclick="forgetPassword()">忘记密码?</a>
                </div> -->
	        </form>
	    </div>
    </div>
</body>
</html>