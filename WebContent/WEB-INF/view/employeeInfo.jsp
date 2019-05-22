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
	 
	  a();
	})
	function a(){
	  $.post("selectEmployeeInfo",{
		  e_loginName:${employee.e_loginName }
	  },function(res){
		  $('#updateForms').form('load',res[0]);	// 读取表单的URL
	  },"json")
		
		


	}
	function updateDialog(){
		$.post("selectEmployeeInfo",{
			e_id:$("#e_id").val(),
			e_loginName:$("#e_loginName").val(),
			e_passWord:$("#e_passWord").val(),
			e_lastLoginTime:$("#e_lastLoginTime").val(),
			e_createTime:$("#e_createTime").val(),
			e_pwdWrongTime:$("#e_pwdWrongTime").val(),
			e_lockTime:$("#e_lockTime").val(),
			e_protectEMail:$("#e_protectEMail").val(),
			e_protectMTel:$("#e_protectMTel").val(),
			e_fingerprintNum:$("#e_fingerprintNum").val(),
			e_liveAddress:$("#e_liveAddress").val(),
			e_sex:$("#e_sex").val(),
			e_age:$("#e_age").val(),
			e_photo:$("#e_photo").val(),
			e_isMarry:$("#e_isMarry").val(),
			e_fromAddress:$("#e_fromAddress").val(),
			e_eduStatus:$("#e_eduStatus").val(),
			e_weiXin:$("#e_weiXin").val()
			
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

	
	
	
</script>
</head>
<body>
	
	<table id="dg">
		
	</table>
	
	<div id="updateDialog" title="修改" data-options="modal:true">  
		<form id="updateForms" class="easyui-form">   
				编号：<input class="easyui-textbox" data-options="disabled:true" type="text" id="e_id" name="e_id" /><br/>
				登录名：<input class="easyui-textbox"  type="text" id="e_loginName" name="e_loginName" />
				密码：<input class="easyui-textbox"  data-options="disabled:true"   type="password" id="e_passWord" name="e_passWord" /><br/>
				<!-- 是否锁定：<input class="easyui-switchbutton" data-options="onText:'Yes',offText:'No'" type="text" id="e_isLockout" name="e_isLockout" /> -->
				最后一次登录时间：<input class="easyui-textbox"   type="text" id="e_lastLoginTime" name="e_lastLoginTime" /><br/>
				创建时间：<input class="easyui-textbox" type="text" id="e_createTime" name="e_createTime" />
				密码错误次数：<input class="easyui-textbox" type="text" id="e_pwdWrongTime" name="e_pwdWrongTime" /><br/>
				被锁定时间：<input class="easyui-textbox" type="text" id="e_lockTime" name="e_lockTime" />
				密保邮箱：<input class="easyui-textbox" type="text" id="e_protectEMail" name="e_protectEMail" /><br/>
				密保手机号：<input class="easyui-textbox" type="text" id="e_protectMTel" name="e_protectMTel" />
				指纹码：<input class="easyui-textbox" data-options="disabled:true" type="password" id="e_fingerprintNum" name="e_fingerprintNum" /><br/>
				员工现住址：<input class="easyui-textbox" data-options="prompt:'dfadsf'" type="text" id="e_liveAddress" name="e_liveAddress" />
				员工性别：<input class="easyui-textbox" type="text" id="e_sex" name="e_sex" /><br/>
				员工年龄：<input class="easyui-textbox"  type="text" id="e_age" name="e_age" />
				员工照片：<input class="easyui-textbox" type="text" id="e_photo" name="e_photo" /><br/>
				是否结婚：<input class="easyui-textbox" type="text" id="e_isMarry" name="e_isMarry" />
				员工籍贯：<input class="easyui-textbox" type="text" id="e_fromAddress" name="e_fromAddress" /><br/>
				学历状态：<input class="easyui-textbox" type="text" id="e_eduStatus" name="e_eduStatus" />
				员工微信：<input class="easyui-textbox" type="text" id="e_weiXin" name="e_weiXin" /><br/>
				入职时间：<input class="easyui-textbox" data-options="disabled:true" type="text" id="e_inCompanyTime" name="e_inCompanyTime" /><br/>
			
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveemployeeInfo()">保存</a> 
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="quxiaoemployeeInfo()">取消</a> 
		</form>	
	</div>			
		 
</body>
</html>