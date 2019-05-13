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
		    checkbox:true,
		    onDblClick: function(node){// 在用户双击的时候提示
				$("#up").form("load", node);
				$("#updates").dialog("open");
			}

		});  
	})
	function update(){
		var nodes = $("#tt").tree('getChecked',['checked','indeterminate']);//获取选中的值
		$("#up").form("load", {
			id:nodes[0].id,
			text:nodes[0].text
		});
		$("#updates").dialog("open");
	}
	//修改数据
	function uprole(){
		$.post("../updates",{
			r_id:$("#r_id").val(),
			r_name:$("#r_name").val()
		},function(res){
			if(res){
				$("#tt").tree("reload");
				$("#updates").dialog("close");
				return $.messager.alert("提示", "修改成功");
			}else{
				return $.messager.alert("提示", "修改失败");
			}
		})
	}
	//点击添加按钮打开添加对话框
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
	//删除角色
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
<body class="easyui-layout">	
		<!-- 工具栏 -->
		<div data-options="region:'north',border:false" style="height:40px;padding:10px">
       			<a href="javascript:void(0)"  class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="update()">修改</a>
       			<a href="javascript:void(0)"  class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deletes()">删除</a>
       			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加角色</a>
    	</div>
    		<div data-options="region:'center',title:'角色'">
    				<ul id="tt"></ul>
    		</div>
    	<!-- 添加对话框 -->
		<div id="addtree" class="easyui-dialog" data-options="resizable:true,modal:true,closed:true">
			<form id="xg" class="easyui-form">
				<label for="name">角色名称:</label> 
				<input class="easyui-textbox" type="text" id="rname"/>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="addrole()">添加</a>
			</form>
		</div>
		
		<!-- 修改对话框 -->
		<div id="updates" class="easyui-dialog" data-options="resizable:true,modal:true,closed:true">
			<form id="up" class="easyui-form">
				<div style="display: none">
					<input class="easyui-textbox" type="text" id="r_id" name="id" />
				</div>
				<label for="name">角色名称:</label> 
				<input class="easyui-textbox" type="text" id="r_name" name="text"/>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"  onclick="uprole()">修改</a>
			</form>
		</div>
</body>
</html>