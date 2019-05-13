<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../js/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" href="../js/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
	init();
})

function init() {
	var ispay=$("#ispay").combobox('getValue');
	if(ispay=="--请选择--"){
		ispay='';
	}
	if(ispay=="已回访"){
		ispay='1';
	}
	if(ispay=="未回访"){
		ispay='0';
	}
	
	$('#dg').datagrid({
	    url:'../NetFollowService',
	    method:"post",
	    pagination:true,
	    singleSelect:true,
	     toolbar:'#tb',
	     queryParams:{
	    	 n_stuName:$("#n_stuName").val(),
	    	 e_id:$("#e_id").val(),
	    	 startn_followTime:$("#startn_followTime").val(),
	    	 endn_followTime:$("#endn_followTime").val(),
	    	 s_isReturnVisit:$("#s_isReturnVisit").val(),
	    	 n_followType:$("#n_followType").val()
		    },
	     columns:[[
	        {field:'n_id',title:'ID',width:100},
	        {field:'n_stuId',title:'学生ID',width:100},
	        {field:'n_stuName',title:'学生姓名',width:100},
	        {field:'n_followTime',title:'跟踪时间',width:100},
	        {field:'n_nextFollowTime',title:'学生地址',width:100},
	        {field:'n_context',title:'下次跟踪时间',width:100},
	        {field:'e_id',title:'员工id',width:100},
	        {field:'e_loginName',title:'登录名',width:100},
	        {field:'s_id',title:'学生编号',width:100},
	        {field:'s_name',title:'学生姓名',width:100},
	        {field:'s_isReturnVisit',title:'是否回访',width:100,formatter:formattersfhf},
	        {field:'caozuo',title:'操作',width:100,formatter:formattercaozuo}
	     
	    ]]
	});
}
function formattercaozuo(value,row,index){
	return "  <a href='javascript:void(0)' onclick='lookNetFollow("+index+")'>查看</a> "
}
function formattersfhf(value,row,index) {
	return value==0? '未回访':'已回访';
} 
</script>
</head>
<body>
	<table id="dg" style="width:100%"> </table>

<div id="tb">
		学生名称：<input class="easyui-textbox" name="aname" id="n_stuName" style="width:180px">
		跟踪者：<input class="easyui-textbox" name="asex" id="e_id" style="width:180px">
		跟踪开始时间：<input class= "easyui-datebox" name="aage" id="startn_followTime" style="width:180px">-跟踪结束时间：<input class= "easyui-datebox" name="aage" id="endn_followTime" style="width:180px">
		回访情况：
				 <label for="name" style="width:140px">是否回访:</label>  
			    		<select style="width:140px" id="ispay" class="easyui-combobox">
				    		<option >已回访</option>
				    		<option >未回访</option>
				    	</select>
				    <div> 
		跟踪方式：<input class="easyui-textbox" name="aname" id="n_followType" style="width:180px">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="init()">搜索</a>
	
</div>

<!-- <div id="addDialog" class="easyui-dialog" style="width:400px;height:200px;" data-options="resizable:true,modal:true,closed:true">   
	<form id="addForm">
		姓名：<input class="easyui-textbox" name="aname" id="anameAdd" style="width:100px"><br/>
		性别：<input class="easyui-textbox" name="asex" id="asexAdd" style="width:100px"><br/>
		日期：<input class="easyui-textbox" name="aage" id="aageAdd" style="width:100px"><br/>
		地址：<input class="easyui-textbox" name="address" id="addressAdd" style="width:100px"><br/>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="add()">确定</a>
	</form>
</div>  --> 

<!-- <div id="detailDialog" class="easyui-dialog" style="width:400px;height:200px;" data-options="resizable:true,modal:true,closed:true">   
	<form id="detailForm">
		ID：<input class="easyui-textbox" name="aid" id="aidDetail" style="width:100px"><br/>
		姓名：<input class="easyui-textbox" name="aname" id="anameDetail" style="width:100px"><br/>
		性别：<input class="easyui-textbox" name="asex" id="asexDetail" style="width:100px"><br/>
		日期：<input class="easyui-textbox" name="aage" id="aageDetail" style="width:100px"><br/>
		地址：<input class="easyui-textbox" name="address" id="addressDetail" style="width:100px"><br/>
	</form>
</div>  

<div id="updateDialog" class="easyui-dialog" style="width:400px;height:200px;" data-options="resizable:true,modal:true,closed:true">   
	<form id="updateForm">
		ID：<input class="easyui-textbox" name="aid" id="aidUpdate" style="width:100px" disabled="disabled"><br/>
		姓名：<input class="easyui-textbox" name="aname" id="anameUpdate" style="width:100px"><br/>
		性别：<input class="easyui-textbox" name="asex" id="asexUpdate" style="width:100px"><br/>
		日期：<input class="easyui-textbox" name="aage" id="aageUpdate" style="width:100px"><br/>
		地址：<input class="easyui-textbox" name="address" id="addressUpdate" style="width:100px"><br/>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" onclick="update()">确定</a>
	</form>
</div> -->
</body>
</html>