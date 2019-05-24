<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
pageContext.setAttribute("path",request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
	init();
})

function init() {
	$('#dg').datagrid({
	    url:'NetFollowSer',
	    method:"post",
	    pagination:true,
	    singleSelect:true,
	     toolbar:'#tb',
	     queryParams:{
	 		n_stuName:$("#n_stuNameq").val(),
	 		n_followTime:$("#startn_followTimeq").val(),
	 		n_nextFollowTime:$("#endn_followTime").val(),
	 		n_context:$("#n_contextq").val(),
	 		s_isReturnVisit:$("#ispayq").val(),
	 		e_id:${employee.e_id}, 
	 		e_loginName:"${employee.e_loginName}",
	 		n_followType:$("#n_followTypeq").val(),
	 		
	 		n_createTime:$("#n_createTimeq").val(),
	 		n_followStatus:$("#n_followStatusq").val()
		    },
	     columns:[[
	        {field:'n_id',title:'ID',width:100},
	        {field:'n_stuId',title:'学生ID',width:100},
	        {field:'n_stuName',title:'学生姓名',width:100},
	        {field:'n_followTime',title:'跟踪时间',width:100},
	        {field:'n_nextFollowTime',title:'下次跟踪时间',width:100},
	        {field:'n_context',title:'跟踪内容',width:100},
	        {field:'n_followType',title:'跟踪方式',width:100},
	        {field:'employee',title:'员工id',width:100,formatter:formatterslnid},
	        {field:'employee.e_loginName',title:'登录名',width:100,formatter:formattersln},
	        {field:'studentt',title:'学生编号',width:100,formatter:formattersid},
	        {field:'student.s_isReturnVisit',title:'是否回访',width:100,formatter:formattersfhf},
	        {field:'caozuo',title:'操作',width:100,formatter:formattercaozuo}
	     
	    ]]
	}); 
}

function lookNetFollow(index){
	var data=$("#dg").datagrid("getData");
	var row=data.rows[index];
	$("#lookform").form("load",row);
	$("#looknet").dialog("open");
	
}

function formattercaozuo(value,row,index){
	return "  <a href='javascript:void(0)' onclick='lookNetFollow("+index+")'>查看</a> "
}

function formattersid(value,row,index){
	return row.student.s_id;
}
function formattersln(value,row,index){
	return row.employee.e_loginName;
}

function formatterslnid(value,row,index){
	return row.employee.e_id;
}

function formattersfhf(value,row,index) {
	var status = "";
	if (row.student.s_isReturnVisit == "0") {
		status = "未回访";
	} else {
		status = "已回访";
	}
	return status;
} 


</script>
</head>
<body>
	<table id="dg" style="width:100%"> </table>

		<div id="tb">
				学生名称：<input class="easyui-textbox" name="aname" id="n_stuNameq" style="width:180px">
				跟踪者：<input class="easyui-textbox" name="asex" id="e_idq" style="width:180px">
				跟踪开始时间：<input class= "easyui-datebox" name="aage" id="startn_followTimeq" style="width:180px">-跟踪结束时间：<input class= "easyui-datebox" name="aage" id="endn_followTime" style="width:180px">
				回访情况：
						 <label for="name" style="width:140px"></label>  
					    		<select style="width:140px" id="ispayq" name="s_isReturnVisit" class="easyui-combobox">
					    			<option value="">--请选择--</option>
					    			<option value="0">未回访</option>
						    		<option value="1">已回访</option>
						    		
						    	</select>
						    <div> 
								跟踪方式：<input class="easyui-textbox" name="aname" id="n_followTypeq" style="width:180px">
								<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="init()">搜索</a>
								<a href="inStudentUpdate" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">返回上一层</a>
	
							</div>
		</div>

<div id="looknet" class="easyui-dialog" title="查看信息"  style="width:400px; height:400px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
			
		<form id="lookform" class="easyui-form">   
			<table>
				<tr>
					<td><label>学生ID：</label></td>
			        <td><input class="easyui-textbox" data-options='disabled:true' type="text" id="n_stuId" name="n_stuId" /></td>
			    </tr>
			    <tr>
					<td><label>学生姓名：</label></td>
			        <td><input class="easyui-textbox"data-options='disabled:true' type="text" id="n_stuName" name="n_stuName" /></td>
			    </tr>
			    <tr>
					<td><label>跟踪时间：</label></td>
			        <td><input class="easyui-textbox"data-options='disabled:true' type="text" id="n_followTime" name="n_followTime" /></td>
			    </tr>
			    <tr>
					<td><label>下次跟踪时间：</label></td>
			        <td><input class="easyui-textbox"data-options='disabled:true' type="text" id="n_nextFollowTime" name="n_nextFollowTime" /></td>
			    </tr>
			    <tr>
					<td><label>跟踪内容：</label></td>
			        <td><input class="easyui-textbox"data-options='disabled:true' type="text" id="n_context" name="n_context" /></td>
			    </tr>
			    <tr>
			        <td><label>员工id：</label></td>
			        <td><input class="easyui-textbox"data-options='disabled:true' type="text" id="e_id" name="e_id" /></td>
			    </tr>
			    <tr>
			        <td><label>登录名：</label></td>
			        <td><input class="easyui-textbox"data-options='disabled:true' type="password" id="e_loginName" name="e_loginName" /></td>
			    </tr>
			    <tr>
			        <td><label>学生编号：</label></td>
			        <td><input class= "easyui-textbox"data-options='disabled:true' type= "text" id="s_id" name="s_id" /></td>
			    </tr>
			    
			    <tr>
			        <td><label>跟踪状态：</label></td>
			        <td><input class="easyui-textbox" data-options='disabled:true' type="text" id="n_followStatus" name="n_followStatusq" /></td>
			    </tr>
		    </table>
		</form>  
	</div>
<!-- <script type="text/javascript">
function addnetfollow(){
	$('#win').window('open');
}

function addsave(){

	$.post("insertNetFollow",{
		n_stuId:$("#n_stuIdq").val(),
		n_stuName:$("#n_stuNameq").val(),
		n_followTime:$("#n_followTimeq").val(),
		n_nextFollowTime:$("#n_nextFollowTimeq").val(),
		n_context:$("#n_contextq").val(),
		e_id:$("#e_idq").val(),
		n_followType:$("#n_followTypeq").val(),
		n_createTime:$("#n_createTimeq").val(),
		n_followStatus:$("#n_followStatusq").val()
		
	},function(res){
		
		if(res>0){
			$.messager.alert("提示","添加成功！！！","info");
			$("#win").dialog("close");
			$("#dg").datagrid("reload");
			
		}else{
			$.messager.alert("提示","添加失败！！！","error");
		}
	},"json");
	$("#win").form("clear");
}  
</script> -->
</body>
</html>