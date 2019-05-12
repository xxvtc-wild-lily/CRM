<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../js/jquery-easyui-1.7.0/themes/icon.css">
<link rel="stylesheet" href="../js/jquery-easyui-1.7.0/themes/default/easyui.css">
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		init()
	})
	function init(){
		$("#empTab").datagrid({
			url:'../selectEmployee',
			method:'post',
			pagination:true,
			singleSelect:true,
			toolbar:"#tb",
			queryParams:{
				e_loginName:$("#e_loginName").val(),
				in_e_createTime:$("#in_e_createTime").val(),
				en_e_createTime:$("#en_e_createTime").val(),
				e_isLockOut:$("#e_isLockOut").val()
			}
		
		});
		$('#tabfrm').form('clear');
	}
	function formattercaozuo(value,row,index){
		
		return "<a href='javascript:void(0)' onclick='updateEmployee("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='deleteEmployee("+index+")'>删除</a>"
	}
	function formatterimg(value,row,index){
		if(value != null && value != ''){
			return "<img style='width:40px;height:50px;' src='../image/"+value+"'>"
		}
	}
	function addEmployee(){
		$("#addDialog").dialog("open");
	}
	function add(){
		var e_loginName=$("#e_loginName").val();
		var e_passWord=$("#e_passWord").val();
		var e_protectEmail=$("#e_protectEmail").val();
		var e_protectMTel=$("#e_protectMTel").val();
		var e_fingerprintNum=$("#e_fingerprintNum").val();
		$.post("../insertEmployee",{
			e_loginName:e_loginName,
			e_passWord:e_passWord,
			e_protectEmail:e_protectEmail,
			e_protectMTel:e_protectMTel,
			e_fingerprintNum:e_fingerprintNum
		},function(res){
			if(res>0){
				$.messager.alert("提示","添加成功！","info");
				$("#addDialog").dialog("close");
				$("#empTab").datagrid("reload");
			}else{
				$.messager.alert("提示","添加失败！","error");
			}
		},"json");
		$('#addForm').form('clear');
	}

	function deleteEmployee(index){
		var data=$("#empTab").datagrid("getData");
		var row=data.rows[index];
		$.messager.confirm('确认','您确认想要删除吗？',function(r){    
		    if (r){    
		          $.post("../deleteEmployee",{e_id:row.e_id},function(res){
		        	  if(res>0){
		        		  $("#empTab").datagrid("reload");
		        		  $.messager.alert('确认','删除成功');
		        	  }else{
		        		  $.messager.alert('确认','删除失败');
		        	  }
		          },"json")  
		    }    
		});  
	}
	function updateEmployee(index){
		var data=$("#empTab").datagrid("getData");
		var row=data.rows[index];
		$('#updateForm').form('load',row);
		$("#updateDialog").dialog("open");
	}
	function saveUpdat(){
		$.post("../updateEmployee",{
			e_loginName:$("#updatee_loginName").val(),
			e_passWord:$("#updatee_passWord").val(),
			e_protectEmail:$("#updatee_protectEmail").val(),
			e_protectMTel:$("#updatee_protectMTel").val(),
			e_fingerprintNum:$("#updatee_fingerprintNum").val()
		},function(res){
			if(res>0){
				$.messager.alert("提示","修改成功！","info");
				$("#updateDialog").dialog("close");
				$("#empTabg").datagrid("reload");
			}else{
				$.messager.alert("提示","修改失败！","error");
			}
		},"json")
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
	        <input class="easyui-validatebox" type="text"  id="e_loginName"/>   
	        
	        <label for="name">创建时间:</label>   
	        <input class="easyui-validatebox" type="text"  id="in_e_createTime"/>~
	        <input class="easyui-validatebox" type="text"  id="en_e_createTime"/>    
			
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
			<a href="javascript:void(0)" onclick="addEmployee()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">创建</a>
		</form>
	</div>
	
	<div id="addDialog" class="easyui-dialog" title="创建" style="width:400px;height:600px;"  data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<form id="addForm" method="post">   
			<table>
			    <tr>
			        <td><label>登录名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_loginName" name="e_loginName" data-options="required:true"/></td>
			    </tr>
			    <tr>
			        <td><label>密码：</label></td>
			        <td><input class="easyui-textbox" type="password" id="e_passWord" name="e_passWord" data-options="required:true"/></td>
			    </tr>
			    <tr>
			        <td><label>密保邮箱：</label></td>
			        <td><input class= "easyui-datebox" type= "text" id="e_protectEmail" name="e_protectEmail" /></td>
			    </tr>
			    <tr>
			        <td><label>密保手机号：</label></td>
			        <td><input class="easyui-textbox" type="text" name="e_protectMTel" id="e_protectMTel" /></td>
			    </tr>
			    <tr>
			        <td><label>指纹码：</label></td>
			        <td><input class="easyui-textbox" type="text" name="e_fingerprintNum" id="e_fingerprintNum" /></td>
			    </tr>
			    <tr>
			    	<td><a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="add()">确定</a></td>
			    </tr>
		    </table>
		</form>  
	</div>
	<div id="updateDialog" class="easyui-dialog" title="修改" data-options="modal:true,closed:true,
			buttons:[{
				text:'保存',
				handler:function(){saveUpdat();}
			},{
				text:'关闭',
				handler:function(){closeUpdat();}
			}]">  
		<form id="updateForm" method="post">   
			<table>
				<tr>
					<td><label>编号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updatee_id" name="e_id" /></td>
			    </tr>
			    <tr>
			        <td><label>登录名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updatee_loginName" name="e_loginName" /></td>
			    </tr>
			    <tr>
			        <td><label>密码：</label></td>
			        <td><input class="easyui-textbox" type="password" id="updatee_passWord" name="e_passWord" /></td>
			    </tr>
			    <tr>
			        <td><label>密保邮箱：</label></td>
			        <td><input class= "easyui-textbox" type= "text" id="updatee_protectEmail" name="e_protectEmail" /></td>
			    </tr>
			    <tr>
			        <td><label>密保手机号：</label></td>
			        <td><input class="easyui-textbox" type="text" name="updatee_protectMTel" id="e_protectMTel" /></td>
			    </tr>
			    <tr>
			        <td><label>指纹码：</label></td>
			        <td><input class="easyui-textbox" type="text" name="updatee_fingerprintNum" id="e_fingerprintNum" /></td>
			    </tr>
		    </table>
		</form>  
	</div>
</body>
</html>