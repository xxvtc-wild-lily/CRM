<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="js/jquery-easyui-1.7.0/themes/icon.css">
<link rel="stylesheet" href="js/jquery-easyui-1.7.0/themes/default/easyui.css">
<script type="text/javascript" src="js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		init()
	})
	function init(){
		$("#empTab").datagrid({
			url:'selectEmployee',
			method:'post',
			pagination:true,
			singleSelect:true,
			toolbar:"#tar",
			queryParams:{
				id:$("#id").val(),
				name:$("#name").val(),
				age:$("#age").val(),
				birthday:$("#birthday").val()
			}
		});
	}
	function formattercaozuo(value,row,index){
		
		return "<a href='javascript:void(0)' onclick='updateEmployee("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='deleteEmployee("+index+")'>删除</a>"
	}
	function formatterimg(value,row,index){
		if(value != null && value != ''){
			return "<img style='width:40px;height:50px;' src='image/"+value+"'>"
		}
	}
</script>
</head>
<body>
	<table id="empTab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'e_id',title:'编号'  "></th>
				<th data-options="field:'e_loginName',title:'登录名'  "></th>
				<th data-options="field:'e_passWord',title:'密码'  "></th>
				<th data-options="field:'e_isLockOut',title:'是否锁定'  "></th>
				<th data-options="field:'e_lastLoginTime',title:'最后一次登录时间'  "></th>
				<th data-options="field:'e_createTime',title:'创建时间'  "></th>
				<th data-options="field:'e_pwdWrongTime',title:'密码错误次数'  "></th>
				<th data-options="field:'e_lockTime',title:'被锁定时间'  "></th>
				<th data-options="field:'e_protectEmail',title:'密保邮箱'  "></th>
				<th data-options="field:'e_protectMTel',title:'密保手机号'  " ></th>
				<th data-options="field:'e_fingerprintNum',title:'指纹码'  "></th>
				<th data-options="field:'e_liveAddress',title:'员工现住址'  "></th>
				<th data-options="field:'e_sex',title:'员工性别'  "></th>
				<th data-options="field:'e_age',title:'员工年龄'  "></th>
				<th data-options="field:'e_photo',title:'员工照片' , formatter:formatterimg"></th>
				<th data-options="field:'e_isMarry',title:'是否结婚'  "></th>
				<th data-options="field:'e_fromAddress',title:'员工籍贯'  "></th>
				<th data-options="field:'e_eduStatus',title:'学历状态'  "></th>
				<th data-options="field:'e_weiXin',title:'员工微信'  "></th>
				<th data-options="field:'e_inCompanyTime',title:'入职时间'  "></th>
				<th data-options="field:'e_leaveCompanyTime',title:'离职时间'  "></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<form  id="tabfrm" class="easyui-form">
	        <label for="name">用户名:</label>   
	        <input class="easyui-validatebox" type="text"  id="id" data-options="required:true" />   
	        
	        <label for="name">签到状态:</label>   
	        <input class="easyui-validatebox" type="text"  id="name" data-options="required:true" />   
			
	        <label for="name">员工年龄:</label>   
	        <input class="easyui-validatebox" type="text"  id="age" data-options="required:true" />   
			
	        <label for="name">创建时间:</label>   
	        <input class="easyui-validatebox" type="text"  id="birthday" data-options="required:true" />   
	    	  
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
		</form>
	</div>
</body>
</html>