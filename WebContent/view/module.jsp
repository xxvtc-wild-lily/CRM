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
		init();
	})
		function init(){
		$('#tt').treegrid({    
		    url:'../module',
		    method:'post',
		    idField:'id',    
		    treeField:'name',
		    checkbox:true,
		    columns:[[    
		        {title:'编号',field:'id',width:40},    
		        {field:'name',title:'名称',width:180},    
		        {field:'m_path',title:'路径',width:180}, 
		    ]],
		    onDblClickRow: function(node){// 在用户双击的时候提示
				$("#up").form("load", node);
				$("#updates").dialog("open");
			}
		});  
	}
	
	
	function update(){
		/* var nodes = $("#tt").treegrid('getSelections');//获取选中的值
		/* var row = $('#tt').treegrid('getSelected');//获取选中那一行的数据 */
		/* var row = data.rows[0]; */
		/* alert(nodes)
		$("#up").form("load",nodes);
		$("#updates").dialog("open"); */
	}
	
</script>
</head>
<body>	<!-- 工具栏 -->
		<div data-options="region:'north',border:false" style="height:40px;padding:10px">
       			<a href="javascript:void(0)"  class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="update()">修改模块</a>
       			<a href="javascript:void(0)"  class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="deletes()">删除模块</a>
       			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加模块</a>
    	</div>
		<table id="tt" style="width:600px;height:400px"></table>
		  <!-- 修改对话框 -->
		<div id="updates" class="easyui-dialog" data-options="resizable:true,modal:true,closed:true">
			<form id="up" class="easyui-form">
				<div style="display: none">
					<input class="easyui-textbox" type="text" id="m_id" name="id" />
				</div>
				<label for="name">角色名称:</label> 
				<input class="easyui-textbox" type="text" id="m_name" name="name"/>
				<label for="name">路径:</label> 
				<input class="easyui-textbox" type="text" id="m_path" name="m_path"/>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"  onclick="uprole()">修改</a>
			</form>
		</div>
</body>
</html>