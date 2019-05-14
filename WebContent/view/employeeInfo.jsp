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

	

	
</script>
</head>
<body>

		



<div id="updateDialog" > 
		<form id="fom" name="fom" action="">
	

				编号：<input class="easyui-textbox" data-options="disabled:true" type="text" id="e_id" name="e_id" /><br/>
				登录名：<input class="easyui-textbox" type="text" id="e_loginName" name="e_loginName" /><br/>
				密码：<input class="easyui-textbox" data-options="disabled:true" type="text" id="e_passWord" name="e_passWord" /><br/>
				是否锁定：<input class="easyui-switchbutton" data-options="onText:'Yes',offText:'No'" type="text" id="e_isLockout" name="e_isLockout" /><br/>
				最后一次登录时间：<input class="easyui-textbox" type="text" id="e_lastLoginTime" name="e_lastLoginTime" /><br/>
				创建时间：<input class="easyui-textbox" type="text" id="e_createTime" name="e_createTime" /><br/>
				密码错误次数：<input class="easyui-textbox" type="text" id="e_pwdWrongTime" name="e_pwdWrongTime" /><br/>
				被锁定时间：<input class="easyui-textbox" type="text" id="e_lockTime" name="e_lockTime" /><br/>
				密保邮箱：<input class="easyui-textbox" type="text" id="e_protectEMail" name="e_protectEMail" /><br/>
				密保手机号：<input class="easyui-textbox" type="text" id="e_protectMTel" name="e_protectMTel" /><br/>
				指纹码：<input class="easyui-textbox" data-options="disabled:true" type="text" id="e_fingerprintNum" name="e_fingerprintNum" /><br/>
				员工现住址：<input class="easyui-textbox" data-options="prompt:'dfadsf'" type="text" id="e_liveAddress" name="e_liveAddress" /><br/>
				员工性别：<input class="easyui-textbox" type="text" id="e_sex" name="e_sex" /><br/>
				员工年龄：<input class="easyui-textbox" type="text" id="e_age" name="e_age" /><br/>
				员工照片：<input class="easyui-textbox" type="text" id="e_photo" name="e_photo" /><br/>
				是否结婚：<input class="easyui-textbox" type="text" id="e_isMarry" name="e_isMarry" /><br/>
				员工籍贯：<input class="easyui-textbox" type="text" id="e_fromAddress" name="e_fromAddress" /><br/>
				学历状态：<input class="easyui-textbox" type="text" id="e_eduStatus" name="e_eduStatus" /><br/>
				员工微信：<input class="easyui-textbox" type="text" id="e_weiXin" name="e_weiXin" /><br/>
				入职时间：<input class="easyui-textbox" data-options="disabled:true" type="text" id="e_inCompanyTime" name="e_inCompanyTime" /><br/>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveemployeeInfo()">保存</a> 
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="quxiaoemployeeInfo()">取消</a> 
				
			  
			
		</form>	
	</div>			
		 
</body>
</html>