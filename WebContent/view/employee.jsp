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
				e_isLockOut:$("#e_isLockOut").combobox("getValue")
			}
		
		});
		$('#tabfrm').form('clear');
	}
	function formattercaozuo(value,row,index){
		
		return "<a href='javascript:void(0)' onclick='updateEmployee("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='deleteEmployee("+index+")'>删除</a>  <a href='javascript:void(0)' onclick='openUpdateRoleDialog("+index+")'>修改角色</a>"
	}
	function formatterimg(value,row,index){
		if(value != null && value != ''){
			return "<img style='width:40px;height:50px;' src='../image/"+value+"'>"
		}
	}
	function formattersfsd(value,row,index) {
		var e_isLockOut = row.e_isLockOut;
		var status = "";
		if (e_isLockOut == null) {
			status = "未锁定"
		} else if (e_isLockOut == 0) {
			status = "未锁定"
		} else {
			status = "已锁定"
		}
		return status;
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
			e_id:$("#updatee_id").val(),
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
	
	function openUpdateRoleDialog(index) {
		var data = $("#empTab").datagrid("getData");
		var row = data.rows[index];
		var e_loginName = row.e_loginName;
		alert(e_loginName);
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
				<th data-options="field:'e_isLockOut',title:'是否锁定'  ,formatter:formattersfsd"></th>
				<th data-options="field:'e_lastLoginTime',title:'最后一次登录时间'  "></th>
				<th data-options="field:'e_createTime',title:'创建时间'  "></th>
				<th data-options="field:'e_protectEmail',title:'密保邮箱'  "></th>
				<th data-options="field:'e_protectMTel',title:'密保手机号'  " ></th>
				<th data-options="field:'e_fingerprintNum',title:'指纹码'  "></th>
				<th data-options="field:'e_sex',title:'员工性别'  "></th>
				<th data-options="field:'e_age',title:'员工年龄'  "></th>
				<th data-options="field:'e_photo',title:'员工照片' , formatter:formatterimg"></th>
				<th data-options="field:'e_inCompanyTime',title:'入职时间'  "></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<form  id="tabfrm" class="easyui-form">
	        <label for="name">用户名:</label>   
	        <input class="easyui-textbox" type="text"  id="e_loginName"/>   
	        
	        <label for="name">创建时间:</label>   
	        <input class="easyui-datebox" type="text"  id="in_e_createTime"/>~
	        <input class="easyui-datebox" type="text"  id="en_e_createTime"/>    
			
	       	<label for="name">是否锁定:</label>
	        <select id="e_isLockOut" class="easyui-combobox" style="width:100px;">   
			    <option value="">--请选择--</option>   
			    <option value="0">未锁定</option>   
			    <option value="1">已锁定</option>     
			</select>
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
			<a href="javascript:void(0)" onclick="addEmployee()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">创建</a>
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
			        <td><input class="easyui-textbox" type="text" id="updatee_protectMTel" name="e_protectMTel" /></td>
			    </tr>
			    <tr>
			        <td><label>指纹码：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updatee_fingerprintNum" name="e_fingerprintNum" /></td>
			    </tr>
		    </table>
		</form>  
	</div>
</body>
</html>