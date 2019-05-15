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
	
	
	$('#dg').datagrid({
	    url:'../NetFollowSer',
	    method:"post",
	    pagination:true,
	    singleSelect:true,
	     toolbar:'#tb',
	     queryParams:{
	    	 n_stuName:$("#n_stuName").val(),
	    	 startn_followTime:$("#startn_followTime").val(),
	    	 endn_followTime:$("#endn_followTime").val(),
	    	 s_isReturnVisit:$("#ispay").combobox('getValue'),
	    	 n_followType:$("#n_followType").val()
		    },
	     columns:[[
	        {field:'n_id',title:'ID',width:100},
	        {field:'n_stuId',title:'学生ID',width:100},
	        {field:'n_stuName',title:'学生姓名',width:100},
	        {field:'n_followTime',title:'跟踪时间',width:100},
	        {field:'n_nextFollowTime',title:'下次跟踪时间',width:100},
	        {field:'n_context',title:'跟踪内容',width:100},
	        {field:'n_followType',title:'跟踪方式',width:100},
	        {field:'e_id',title:'员工id',width:100},
	        {field:'e_loginName',title:'登录名',width:100},
	        {field:'s_id',title:'学生编号',width:100},
	        {field:'s_name',title:'学生姓名',width:100},
	        {field:'s_isReturnVisit',title:'是否回访',width:100,formatter:formattersfhf},
	        {field:'caozuo',title:'操作',width:100,formatter:formattercaozuo}
	     
	    ]]
	});
}
function lookNetFollow(index){
	var data=$("#dg").datagrid("getData");
	var row=data.rows[index];
	$('#looknetfollow').form('load',row);
	$("#looknet").dialog("open");
}

function formattercaozuo(value,row,index){
	return "  <a href='javascript:void(0)' onclick='lookNetFollow("+index+")'>查看</a> "
}
function formattersfhf(value,row,index) {
	var status = "";
	if (row.student.s_isReturnVisit == "0") {
		status = "未回访";
	} else {
		status = "已回访"
	}
	return status;
} 

function addnetfollow(){
	$('#win').window('open');
}

function addsave(){

	$.post("../insertNetFollow",{
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
	},"json")
	$("#win").form("clear");
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
						 <label for="name" style="width:140px"></label>  
					    		<select style="width:140px" id="ispay" name="s_isReturnVisit" class="easyui-combobox">
					    			<option value="">--请选择--</option>
					    			<option value="0">未回访</option>
						    		<option value="1">已回访</option>
						    		
						    	</select>
						    <div> 
				跟踪方式：<input class="easyui-textbox" name="aname" id="n_followType" style="width:180px">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="init()">搜索</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addnetfollow()">添加</a>
	
		</div>
		
		<div id="looknet" class="easyui-dialog" title="查看" data-options="modal:true,closed:true,
			buttons:[{
				text:'关闭',
				handler:function(){closeUpdat();}
			}]">  
		<form id="looknetfollow" method="post">   
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
			        <td><label>学生姓名：</label></td>
			        <td><input class="easyui-textbox"data-options='disabled:true' type="text" id="s_name" name="s_name" /></td>
			    </tr>
			    <tr>
			        <td><label>是否回访：</label></td>
			        <td><input class="easyui-textbox" data-options='disabled:true' type="text" id="s_isReturnVisit" name="s_isReturnVisit" /></td>
			    </tr>
		    </table>
		</form>  
		</div>
		
		
	<!-- --添加日志- -->
	<div id="win" class="easyui-window" title="添加" data-options="closed:true" style="width:600px;height:400px"   
        data-options="iconCls:'icon-save'">   
	    <div class="easyui-layout" data-options="fit:true">   
		             学生编号：<input id="n_stuIdq" name="" class="easyui-textbox" data-options="" style="width:100px" ><br/>
		             学生姓名：<input id="n_stuNameq" name="" class="easyui-textbox" data-options="" style="width:100px" ><br/>
		             跟踪时间：<input id="n_followTimeq" name="" class="easyui-datebox" data-options="" style="width:100px" ><br/>
	                    下次跟踪时间：<input id="n_nextFollowTimeq" name="" class="easyui-datebox" data-options="" style="width:100px" ><br/>
	                    跟踪内容：<input id="n_contextq" name="" class="easyui-textbox" data-options="" style="width:100px" ><br/>
	                    员工编号：<input id="e_idq" name="" class="easyui-textbox" data-options="" style="width:100px" ><br/>
	                    跟随方式：<input id="n_followTypeq" name="" class="easyui-textbox" data-options="" style="width:100px" ><br/>
	                    创建时间：<input id="n_createTimeq" name="" class="easyui-datebox" data-options="" style="width:100px" ><br/>
	                    跟随状态：<input id="n_followStatusq" name="" class="easyui-textbox" data-options="" style="width:100px" ><br/> 
	                   
	           <!--  学生编号：<input class="easyui-textbox" data-options="" style="width:180px" ><br/>
	             学生编号：<input class="easyui-textbox" data-options="" style="width:180px" ><br/>
	              学生编号：<input class="easyui-textbox" data-options="" style="width:180px" ><br/>
	               学生编号：<input class="easyui-textbox" data-options="" style="width:180px" ><br/>
	                学生编号：<input class="easyui-textbox" data-options="" style="width:180px" ><br/>
	                 学生编号：<input class="easyui-textbox" data-options="" style="width:180px" ><br/>
	                  学生编号：<input class="easyui-textbox" data-options="" style="width:180px" ><br/>   -->      
	                   
	           <a href="javascript:void(0)" onclick="addsave()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">提交</a>
	           <a href="javascript:void(0)" onclick="cancel()" class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true">取消</a>
	            
	    </div>   
	</div>

</body>
</html>