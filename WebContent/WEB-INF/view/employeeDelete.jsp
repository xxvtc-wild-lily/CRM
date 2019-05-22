<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("path",request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/icon.css">
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/default/easyui.css">
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
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
		
		return "<a href='javascript:void(0)' onclick='detail("+index+")'>查看</a> <a href='javascript:void(0)' onclick='deleteEmployee("+index+")'>删除</a> <a href='javascript:void(0)' onclick='openResertPasswordDialog("+index+")'>重置密码</a> <a href='javascript:void(0)' onclick='lockEmployee("+index+")'>锁定用户</a> <a href='javascript:void(0)' onclick='unlockEmployee("+index+")'>解锁用户</a>"
	}
	function formatterimg(value,row,index){
		if(value != null && value != ''){
			return "<img style='width:40px;height:50px;' src='${path }/image/"+value+"'>"
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
	
	function formatterSex (value,row,index) {
        var sex = "";
        if (row.e_sex == "0") {
            sex = "女";
        } else if (row.e_sex == "1") {
            sex = "男";
        } else {
            sex = "未填";
        }
        
        return sex;
    }

	function deleteEmployee(index){
		var data=$("#empTab").datagrid("getData");
		var row=data.rows[index];
		$.messager.confirm('确认','您确认想要删除吗？',function(r){    
		    if (r){    
		          $.post("deleteEmployee",{e_id:row.e_id},function(res){
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
	function detail(index){
		var data=$("#empTab").datagrid("getData");
    	var row=data.rows[index];
    	$("#detailForm").form("load",row);
    	$("#detailDialog").dialog("open");
	}
	function detailClose(){
		$("#detailDialog").dialog("close");
	}
	
	function openResertPasswordDialog (index) {
		var data=$("#empTab").datagrid("getData");
        var row=data.rows[index];
        var e_loginName = row.e_loginName;
        
        $.messager.confirm("确认对话框","您确定要重置密码吗？（重置后的密码为：“ysd123”）", function(r){
            if (r){
            	$.post("resertPassword",{
            		e_loginName:e_loginName
            		},function(res){
            			if (res > 0) {
                            $.messager.alert("提示","重置密码成功！","info");
                        } else {
                            $.messager.alert("提示","重置密码失败！","info");
                        }
            		},"json")
            }
        });
        
	}
	
	// 将用户状态更改为锁定的方法
	function lockEmployee(index) {
		var data = $("#empTab").datagrid("getData");
        var row = data.rows[index];
        var isLock = row.e_isLockOut;
        var e_loginName = row.e_loginName;
        
        if (isLock == "1") {
        	$.messager.alert("提示","该用户已经锁定，无需再锁定！","info");
        } else {
        	$.post("setEmployeeLock",{
        		e_loginName:e_loginName
        	},function(res){
        		if (res > 0) {
        			$.messager.alert("提示","该用户已锁定！","info");
        			$("#empTab").datagrid("reload");
        		} else {
        			$.messager.alert("提示","用户锁定失败！","error");
        		}
        	},"json")
        }
	}
	
	// 将用户锁定状态更改为未锁定的方法
	function unlockEmployee(index) {
        var data = $("#empTab").datagrid("getData");
        var row = data.rows[index];
        var isLock = row.e_isLockOut;
        var e_loginName = row.e_loginName;
        
        if (isLock == "0" || isLock == null) {
            $.messager.alert("提示","该用户未锁定，无需再解锁！","info");
        } else {
            $.post("setEmployeeUnLock",{
                e_loginName:e_loginName
            },function(res){
                if (res > 0) {
                    $.messager.alert("提示","该用户已解锁！","info");
                    $("#empTab").datagrid("reload");
                } else {
                    $.messager.alert("提示","用户解锁失败！","error");
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
				<th data-options="field:'e_isLockOut',title:'是否锁定'  ,formatter:formattersfsd"></th>
				<th data-options="field:'e_lastLoginTime',title:'最后一次登录时间'  "></th>
				<th data-options="field:'e_createTime',title:'创建时间'  "></th>
				<th data-options="field:'e_protectEmail',title:'密保邮箱'  "></th>
				<th data-options="field:'e_protectMTel',title:'密保手机号'  " ></th>
				<th data-options="field:'e_sex',title:'员工性别'  ,formatter:formatterSex"></th>
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
			        <td><label>登录名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updatee_loginName" name="e_loginName" data-options="disabled:true" /></td>
			    </tr>
			    <tr>
			        <td><label>密保邮箱：</label></td>
			        <td><input class= "easyui-textbox" type= "text" id="updatee_protectEmail" name="e_protectEmail" /></td>
			    </tr>
			    <tr>
			        <td><label>密保手机号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updatee_protectMTel" name="e_protectMTel" /></td>
			    </tr>
		    </table>
		</form>  
	</div>
	
	<div class="easyui-dialog" id="updateRoleDialog" title="修改用户角色" style="width:400px;height:200px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true"> 
	   
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
			        <td><input class="easyui-textbox" type="text" id="e_photo"  /></td>
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