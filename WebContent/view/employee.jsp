﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		
		return "<a href='javascript:void(0)' onclick='detail("+index+")'>查看</a> <a href='javascript:void(0)' onclick='updateEmployee("+index+")'>修改</a> <a href='javascript:void(0)' onclick='openUpdateRoleDialog("+index+")'>修改角色</a>"
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
				$("#empTab").datagrid("reload");
			}else{
				$.messager.alert("提示","修改失败！","error");
				
			}
		},"json")
	}
	function closeUpdat(){
		$("#updateDialog").dialog("close");
	}
	
	function openUpdateRoleDialog(index) {
		var data = $("#empTab").datagrid("getData");
		var row = data.rows[index];
		var e_loginName = row.e_loginName;
		var e_id = row.e_id;
		
		// 加载所有角色的datalist
		$("#allRoleDatalist").datalist({ 
		    url:"../getAllRole",
		    singleSelect:false,
		    textFormatter:function (value,row,index) {
		    	return row.r_name;
		    },
		    onClickRow:function (index,row) {
		    	if (row.text == null) {
		    		row.text = "checked";
		    		row.id = e_id;
		    	} else {
		    		row.text = null;
		    	}
		    	
		    }
		});
		// 加载员工已有角色的datalist
		$("#employeeRoleDatalist").datalist({ 
            url:"../getEmployeeRole",
            queryParams:{
                e_loginName:e_loginName
            },
            singleSelect:false,
            textFormatter:function (value,row,index) {
                return row.r_name;
            },
            onClickRow:function (index,row) {
            	if (row.text == null) {
                    row.text = "checked";
                    row.id = e_id;
                } else {
                    row.text = null;
                }
            }
        });
		
		$("#updateRoleDialog").dialog("open");
	}

	function detail(index){
		var data=$("#empTab").datagrid("getData");
    	var row=data.rows[index];
    	$("#detailForm").form("load",row);
    	$("#detailDialog").dialog("open");
	}
	function detailClose(){
		$("#detailDialog").dialog("close");
	}
	
	// 给用户添加角色的方法
	function removeRoleToEmployee() {
		// 查询到选中的用户角色
        var roleData  = $('#allRoleDatalist').datalist("getSelections");
        // 查询用户已有的角色
        var employeeData = $("#employeeRoleDatalist").datalist("getData");
        var arr = "";
        
        // 判断必须选择角色
        if (JSON.stringify(roleData) != "[]") {
            // 判断用户的已有的角色不能为空
            if (employeeData.total != 0) {
                for (var i = 0;i < roleData.length;i++) {
                	var a = 0;
                    for (var j = 0;j < employeeData.total;j++) {
                        if (roleData[i].r_id != employeeData.rows[j].r_id) {
                        	a ++;
                        }
                    }
                    // 如果本次循环的角色id与用户拥有的都不一样，说明用户没有此id，遂添加进数组
                    if(a==employeeData.total){
                    	arr += roleData[i].r_id +","
                    }
                }
            } else {
                // 用户没有角色的判断
                
                // 循环拿到选中的角色id
                for (var i = 0;i < roleData.length;i++) {
                    arr += roleData[i].r_id +","
                }
            }
        } else {
            // 没有选择添加的角色的判断
            $.messager.alert("提示","请至少选择一项！","error");
        }
        
        // 如果数组里没有任何东西就说明全部拥有
        if (arr == "") {
        	$.messager.alert("提示","所选角色以拥有！","error");
        } else {
        	$.post("../removeRoleToEmployee",{
                arr:arr,
                e_id:roleData[0].id
            },function(res){
                if (res > 0) {
                    $.messager.alert("提示","添加成功！","info");
                    $("#employeeRoleDatalist").datalist("reload");
                    $("#allRoleDatalist").datagrid("clearSelections");
                    $("#employeeRoleDatalist").datagrid("clearSelections");
                }
            },"json")
        }
        
	}
	
	// 去除用户角色的方法
	function removeEmployeeToAll() {
		var empRole  = $('#employeeRoleDatalist').datalist("getSelections");
		
		var arr = "";
		
		if (JSON.stringify(empRole) != "[]") {
			for (var i = 0;i < empRole.length;i++) {
				arr += empRole[i].r_id +",";
			}
		} else {
			// 没有选择添加的角色的判断
            $.messager.alert("提示","请至少选择一项！","error");
		}
		
		// 如果数组里没有任何东西就说明全部拥有
        if (arr != "") {
        	$.post("../removeEmployeeToAll",{
                arr:arr,
                e_id:empRole[0].id
            },function(res){
                if (res > 0) {
                    $.messager.alert("提示","移除角色成功！","info");
                    $("#employeeRoleDatalist").datalist("reload");
                    $("#allRoleDatalist").datagrid("clearSelections");
                    $("#employeeRoleDatalist").datagrid("clearSelections");
                }
            },"json")
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
				<th data-options="field:'e_passWord',title:'密码'  ,width:100 "></th>
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
			        <td><input class="easyui-textbox" type="text" id="updatee_id" name="e_id" data-options="disabled:true" /></td>
			    </tr>
			    <tr>
			        <td><label>登录名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updatee_loginName" name="e_loginName" data-options="disabled:true" /></td>
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
	
	<div class="easyui-dialog" id="updateRoleDialog" title="修改用户角色" style="width:auto;height:auto;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
	   <!-- <div id="allRoleDatalist" style="width:150px;float:left;"></div>
	   <button>》》</button>
	   <button>《《</button>
	   <div id="employeeRoleDatalist" style="width:150px;float:right;"></div> -->
	   <table>
	        <tr>
	            <td>所有角色</td>
	            <td></td>
	            <td>用户拥有的角色</td>
	        </tr>
		    <tr>
		        <td><div id="allRoleDatalist" style="height:200px;width:200px;"></div></td>
		        <td>
		            <button id="dl_add" class="easyui-linkbutton" style="width:50px;margin:5px;" onclick="removeRoleToEmployee()">>|</button><br />
		            <button id="dl_remove" class="easyui-linkbutton" style="width:50px;margin:5px;" onclick="removeEmployeeToAll()">|<</button>
		        </td>
		        <td><div id="employeeRoleDatalist" style="height:200px;width:200px;"></div></td>
		    </tr>
	   </table>
    </div>
	<div id="detailDialog" class="easyui-dialog" title="查看信息" style="width:400px;height:400px;"  data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<form id="detailForm" method="post">   
			<table>
			    <tr>
			        <td><label>编号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_id" name="e_id" /></td>
			    </tr>
			    <tr>
			        <td><label>登录名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_loginName" name="e_loginName" /></td>
			    </tr>
			    <tr>
			        <td><label>密码：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_passWord" name="e_passWord" /></td>
			    </tr> 
			    <tr>
			        <td><label>是否锁定：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_isLockOut" name="e_isLockOut" /></td>
			    </tr>
			    <tr>
			        <td><label>最后一次登录时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_lastLoginTime" name="e_lastLoginTime" /></td>
			    </tr>
			    <tr>
			        <td><label>创建时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_createTime" name="e_createTime" /></td>
			    </tr>
			    <tr>
			        <td><label>密码错误次数：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_pwdWrongTime" name="e_pwdWrongTime" /></td>
			    </tr>
			    <tr>
			        <td><label>被锁定时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_lockTime" name="e_lockTime" /></td>
			    </tr>
			    <tr>
			        <td><label>密保邮箱：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_protectEmail" name="e_protectEmail" /></td>
			    </tr>
			    <tr>
			        <td><label>密保手机号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_protectMTel" name="e_protectMTel" /></td>
			    </tr>
			    <tr>
			        <td><label>指纹码：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_fingerprintNum" name="e_fingerprintNum" /></td>
			    </tr>
			    <tr>
			        <td><label>员工现住址：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_liveAddress" name="e_liveAddress" /></td>
			    </tr><tr>
			        <td><label>员工性别：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_sex" name="e_sex" /></td>
			    </tr>
			    <tr>
			        <td><label>员工年龄：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_age" name="e_age" /></td>
			    </tr>
			    <tr>
			        <td><label>员工照片：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_photo" name="e_photo" /></td>
			    </tr>
			    <tr>
			        <td><label>是否结婚：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_isMarry" name="e_isMarry" /></td>
			    </tr> 
			    <tr>
			        <td><label>员工籍贯：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_fromAddress" name="e_fromAddress" /></td>
			    </tr>
			    <tr>
			        <td><label>学历状态：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_eduStatus" name="e_eduStatus" /></td>
			    </tr>
			    <tr>
			        <td><label>员工微信：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_weiXin" name="e_weiXin" /></td>
			    </tr>
			    <tr>
			        <td><label>入职时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_inCompanyTime" name="e_inCompanyTime" /></td>
			    </tr>
			    <tr>
			        <td><label>离职时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_leaveCompanyTime" name="e_leaveCompanyTime" /></td>
			    </tr>
			    <tr>
			    	<td></td>
			        <td><a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="detailClose()" style="width:100px">关闭</a></td>
			    </tr>
		    </table>
		</form>  
	</div>
</body>
</html>