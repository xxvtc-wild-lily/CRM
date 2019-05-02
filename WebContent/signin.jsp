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
    	$("#signInPanel").panel({
    		closable:false,
    		collapsible:false,
    		minimizable:false,
    		maximizable:false
    	})
    })
</script>
</head>
<body>
    <div style="width:600px;margin:150px 500px;">
	    <div class="easyui-panel" id="signInPanel" style="width:500px;height:300px;padding:10px;text-align:center; overflow:hidden;">
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
	                        <input type="text" id="e_passWord" class="easyui-passwordbox" />
	                    </td>
	                </tr>
	                <tr>
                        <td></td>
                        <td>
                            <input type="checkbox" class="easyui-tooltip" title="7天免登录"  style="margin-left:90px;margin-top:5px;" />记住我
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-help'" style="margin-left:70px;margin-top:5px;">忘记密码?</a>
                        </td>
                    </tr>
	            </table>
	            <div style="margin-left:20px;">
	                <a href="javascript:void(0);" type="button" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="signIn()">登录</a>
	            </div>
	        </form>
	    </div>
    </div>
</body>
</html>