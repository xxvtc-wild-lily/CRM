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
		$('#dg').datagrid({
			url : '../role',
			method : "post",
			pagination : true,
			toolbar : "#gjl",
			singleSelect : true,
			columns : [ [
					{field : 'r_id',title : '编号',width : 100},
					{field : 'r_name',title : '姓名',width : 100,formatter:selectIsHaveSameR_name},
					{field : 'caozuo',title : '操作',formatter : function(value, row, index) {
							return "<a href='javascript:void(0)'   onclick='update("
									+ index
									+ ")'>修改</a> <a href='javascript:void(0)'   onclick='deletes("
									+ index + ")'>删除</a>"
						}
					},
					{field : 'quanxian',title : '权限',formatter : function(value, row, index) {
						return "<a href='javascript:void(0)'   onclick='addModule("
								+ index+ ")'>设置</a> "
					}
				}] ]
		});
		
	})
	var sname=new Array();  
	function selectIsHaveSameR_name(value, row, index) {
		sname.push(row.r_name);//向数组中添加元素  
		return row.r_name;
	}
	function update(index){
		var data = $("#dg").datagrid("getData");
		var row = data.rows[index];
		$("#up").form("load", row);
		$("#updates").dialog({
			buttons : [ {
				text : '保存',
				handler : function() {
					uprole()
				}
			}, {
				text : '关闭',
				handler : function() {
					$("#updates").dialog("close")
				}
			} ]

		})
		$("#updates").dialog("open");
	}
	//修改数据
	function uprole(){
		var name=$("#r_name").val();
		for(var i=0;i<sname.length;i++){
			if(name==sname[i]){
				alert("名称已存在")
				return false;
			}
		}
		$.post("../updates",{
			r_id:$("#r_id").val(),
			r_name:name
		},function(res){
			if(res>0){
				$("#dg").datagrid("reload");
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
		var name=$("#rname").val();
		for(var i=0;i<sname.length;i++){
			if(name==sname[i]){
				alert("名称已存在")
				return false;
			}
		}
		$.post("../addrol",{
			r_name:name
		},function(res){
			if(res>0){
				$("#dg").datagrid("reload");
				$("#addtree").dialog("close");
				return $.messager.alert("提示", "添加成功");
			}else{
				return $.messager.alert("提示", "添加失败");
			}
		}) 
	}
	//删除角色
	function deletes(index){
		var data = $("#dg").datagrid("getData");
		var row = data.rows[index];
		$.messager.confirm('提示', '确认删除吗？', function(r) {
			if (r) {
				$.post("../deleterole",{
					rid:row.r_id
				},function(res){
					if(res>0){
						$("#dg").datagrid("reload");
						return $.messager.alert("提示", "删除成功");
					}else{
						return $.messager.alert("提示", "删除失败");
					}
				})
				}
		});
	}
	var ridsss=null;
	var addid=null;
	var deleteid=null;
	function addModule(index){
		var data = $("#dg").datagrid("getRows");
		ridsss=data[index].r_id;
		$("#moduless").dialog({
			closed:false,
			title:"您正在设置"+data[index].r_name
		});
		$('#dd').tree({    
		    url: "../modules",
		    method : "post",
		    checkbox : true,
		    lines : true,
		    animate : true,
		    state : "close",
		    queryParams : {
		    	mid:ridsss
		    },
		    onCheck:function(node,checked){
		    	alert(node+"ddd");
		    	alert(checked+"sss");
		    }
		    
		});
		/* $.post("../module",{
			rid:data[index].r_id
		},function(res){
			alert(res)
			cur_roleId=data[index].r_id,
			$("#dd").tree("loadData",res)
		},"json"); */
		$("#moduless").dialog("open");
	}
	function addmo(){
		var moduleid = $("#dd").tree('getChecked',['checked','indeterminate']);//获取选中的值
		var s = "";
		for (var i = 0;i<moduleid.length;i++) {
			if(s == ""){
				s+=moduleid[i].id;
			}else{
				s+=",";
				s+=moduleid[i].id;
			}
		} 
		/* var roleid = $("#tt").tree('getChecked',['checked','indeterminate']);//获取选中的值
		var d = "";
		for (var i = 0;i<roleid.length;i++) {
			if(d == ""){
				d+=roleid[i].id;
			}else{
				d+=",";
				d+=roleid[i].id;
			}
		}  */
		
		$.post("../updaterolemodule",{
			r_id:ridsss,
			mid:s
		},function(res){
			if(res>0){
				$("#dg").datagrid("reload");
				$("#moduless").dialog("close");
				return $.messager.alert("提示", "添加成功");
			}else{
				return $.messager.alert("提示", "添加失败");
			}
			
		})
	}
</script>
</head>
<body class="easyui-layout">	
		<!-- 工具栏 -->
		<div id="gjl" data-options="region:'north',border:false" style="height:40px;padding:10px">
       			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加角色</a>
    	</div>
    	<table id="dg"></table>
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
					<input class="easyui-textbox" type="text" id="r_id" name="r_id" />
				</div>
				<label for="name">角色名称:</label> 
				<input class="easyui-textbox" type="text" id="r_name" name="r_name"/>
			</form>
		</div>
		<!-- 添加权限 -->
		<div id="moduless" class="easyui-dialog" style="width:300px" data-options="resizable:true,modal:true,closed:true">
    				<ul id="dd"></ul>
    				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="addmo()">添加</a>
    	</div>
</body>
</html>