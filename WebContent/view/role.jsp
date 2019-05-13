<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../js/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" href="../js/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		$('#tt').tree({    
		    url: "../role",
		    method : "post",
		    checkbox:true
		});  
	})
	function update(){
		
	}
	function add(){
		$("#addtree").dialog("open");
	}
	//添加角色
	function addrole(){
		$.post("../addrol",{
			r_name:$("#rname").val()
		},function(res){
			if(res){
				$("#tt").tree("reload");
				$("#addtree").dialog("close");
				return $.messager.alert("提示", "添加成功");
			}else{
				return $.messager.alert("提示", "添加失败");
			}
		})
	}
	
	function deletes(){
		var nodes = $("#tt").tree('getChecked',['checked','indeterminate']);//获取选中的值
		var s = "";
		for (var i = 0;i<nodes.length;i++) {
			if(s == ""){
				s+=nodes[i].id;
			}else{
				s+=",";
				s+=nodes[i].id;
			}
		} 
		$.messager.confirm('提示', '确认删除吗？', function(r) {
			if (r) {
				$.post("../deleterole",{
					roles:s
				},function(res){
					if(res){
						$("#tt").tree("reload");
						return $.messager.alert("提示", "删除成功");
					}else{
						return $.messager.alert("提示", "删除失败");
					}
				})
				}
		});
	}
</script>
</head>
<body>	
		<div  style="width:500px">
			<div data-options="region:'north',border:false" style="height:30px;padding:10px">
       			<a href="javascript:void(0)"   onclick="update()">编辑</a>
       			<a href="javascript:void(0)"   onclick="deletes()">删除</a>
       			<a href="javascript:void(0)"   onclick="add()">添加</a>
    		</div>
    		<div data-options="region:'center',title:'Center'">
    				<ul id="tt"></ul>
    		</div>
		</div>
		<div id="addtree" class="easyui-dialog" data-options="resizable:true,modal:true,closed:true">
			<form id="xg" class="easyui-form">
				<label for="name">角色名称:</label> 
				<input class="easyui-textbox" type="text" id="rname"/>
				<a href="javascript:void(0)"   onclick="addrole()">添加</a>
			</form>
		</div>
</body>
</html>