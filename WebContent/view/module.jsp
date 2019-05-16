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
	var fujeidian;
	var jeidian;
	var zname;
		function init(){
		$('#dd').tree({    
		    url: "../module",
		    method : "post",
		    lines : true,
		    animate : true,
		    state : "close",
		    onContextMenu:function(e,node){
		    	e.preventDefault();
		    	var s=$("#dd").tree('getParent',node.target);
		    	if(s==null){//当节点为父节点是执行
		    		zname=$("#dd").tree('getChildren',node.target);
		    		fujeidian=node.id;
		    		jeidian=node.id;
		    		$("#mm").menu('show',{
			    		left:e.pageX,
			    		top:e.pageY
		    	})
		    	}else{
		    		var d=$("#dd").tree('getParent',node.target);
		    		zname=$("#dd").tree('getChildren',d.target);
		    		fujeidian=node.id;
		    		jeidian=node.id;
		    		$("#mmm").menu('show',{
			    		left:e.pageX,
			    		top:e.pageY
		    	})
		    	}
		    }
		    });
	}
	//父节点的操作
	var upfuname
	function menuHandler(item){
		if(item.name=="add"){
			$("#inserts").dialog("open");
		}
		if(item.name=="del"){
			deletejds();
		}
		if(item.name=="edit"){
			$.post("../selectmobyid",{
				mid:jeidian
			},function(res){
				$("#ups").form("load", res);
				upfuname=$("#m_names").val();
				$("#updatefu").dialog("open");
			},"json");
		}
	}
	//子节点操作
	var namess
	function menuHandlers(item){
		if(item.name=="dels"){
			deletejd();
		}
		if(item.name=="edits"){
			$.post("../selectmobyid",{
				mid:jeidian
			},function(res){
				$("#up").form("load", res);
				$("#updates").dialog("open");
				namess=$("#m_name").val();
			},"json");
			
		}
	}
	//修改子节点
	function uprole(){
		var xianyouname=new Array();  
		
		for(var i=0;i<zname.length;i++){
			if(namess==zname[i].text){
				
			}else{
				xianyouname.push(zname[i].text);
			}		
			}
		var namesss=$("#m_name").val();
		for(var j=0;j<xianyouname.length;j++){
			if(namesss==xianyouname[j]){
				return $.messager.alert("提示", "名字已存在");
				return false;
			}
		}
		$.post("../updatemobyid",{
			m_id : $("#m_id").val(),
			m_name : namesss,
			m_path : $("#m_path").val(),
			m_weight: $("#m_weight").val()
		},function(res){
			if(res>0){
				$("#dd").tree("reload");
				$("#updates").dialog("close");
				return $.messager.alert("提示", "修改成功");
			}else{
				return $.messager.alert("提示", "修改失败");
			}
		},"json");
	}
	//修改父节点
	function uproles(){
		var fujeidian=$("#dd").tree("getRoots");
		var xianyoufuname=new Array();
		alert(upfuname)
		for(var i=0;i<fujeidian.length;i++){
			if(upfuname==fujeidian[i].text){
				
			}else{
				xianyoufuname.push(fujeidian[i].text);
			}		
			}
		alert(xianyoufuname)
		var upfunames=$("#m_names").val();
		for(var j=0;j<xianyoufuname.length;j++){
			if(upfunames==xianyoufuname[j]){
				return $.messager.alert("提示", "名字已存在");
				return false;
			}
		}
		$.post("../updatemobyid",{
			m_id : $("#m_ids").val(),
			m_name : upfunames
		},function(res){
			if(res>0){
				$("#dd").tree("reload");
				$("#updatefu").dialog("close");
				return $.messager.alert("提示", "修改成功");
			}else{
				return $.messager.alert("提示", "修改失败");
			}
		},"json");
	}
	//删除父模块
	function deletejds(){
		$.messager.confirm('提示', '确认删除吗？', function(r) {
			if (r) {
				$.post("../deletemofu",{
					mfid:jeidian
				},function(res){
					if(res>0){
						$("#dd").tree("reload");
						return $.messager.alert("提示", "删除成功");
					}else{
						return $.messager.alert("提示", "有角色拥有该权限删除失败");
					}
				})
				}
		});
	}
	//删除子模块
	function deletejd(){
		$.messager.confirm('提示', '确认删除吗？', function(r) {
			if (r) {
				$.post("../deletemo",{
					mid:jeidian
				},function(res){
					if(res>0){
						$("#dd").tree("reload");
						return $.messager.alert("提示", "删除成功");
					}else{
						return $.messager.alert("提示", "有角色拥有该权限删除失败");
					}
				})
				}
		});
	}
	//添加子节点
	function inserts(){
		var namess=$("#m_namess").val();
			for(var i=0;i<zname.length;i++){
				if(namess==zname[i].text){
					return $.messager.alert("提示", "名字已存在");
					return false;
				}
			}
		$.post("../addmodule",{
			m_name:namess,
			m_weight:$("#m_weightss").val(),
			m_parentId:fujeidian
		},function(res){
			if(res>0){
				$("#dd").tree("reload");
				$("#inserts").dialog("close");
				return $.messager.alert("提示", "添加成功");
			}else{
				return $.messager.alert("提示", "添加失败");
			}
		},"json")
		$("#in").form("clear");
	}
	function addfu(){
		$("#insertfu").dialog("open");
	}
	//添加父节点
	function insertfu(){
		var fujeidian=$("#dd").tree("getRoots");
		var namefu=$("#m_namefus").val();
		for(var i=0;i<fujeidian.length;i++){
			if(namefu==fujeidian[i].text){
				return $.messager.alert("提示", "名字已存在");
				return false;
			}
		}
		$.post("../addfu",{
			m_name:namefu
		},function(res){
			if(res>0){
				$("#dd").tree("reload");
				$("#insertfu").dialog("close");
				return $.messager.alert("提示", "添加成功");
			}else{
				return $.messager.alert("提示", "添加失败");
			}
		},"json");
		$("#infu").form("clear");
	}
</script>
</head>
<body>	
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="addfu()">添加父模块</a>
		<!-- 父节点工具栏 -->
		<div id="mm" class="easyui-menu" data-options="onClick:menuHandler" style="width:160px;">
			<div data-options="iconCls:'icon-add',name:'add'">追加</div>
			<div data-options="iconCls:'icon-edit',name:'edit'">修改</div>
			<div data-options="iconCls:'icon-remove',name:'del'">删除</div>
		</div>
		<!-- 子节点工具栏 -->
		<div id="mmm" class="easyui-menu" data-options="onClick:menuHandlers" style="width:160px;">
			<div data-options="iconCls:'icon-edit',name:'edits'">修改</div>
			<div data-options="iconCls:'icon-remove',name:'dels'">删除</div>
		</div>
		<!-- 权限 -->
    		<ul id="dd"></ul>
    	<!-- 修改父节点对话框 -->
		<div id="updatefu" class="easyui-dialog" data-options="resizable:true,modal:true,closed:true">
			<form id="ups" class="easyui-form">
				<div style="display: none">
					<input class="easyui-textbox" type="text" id="m_ids" name="m_id" />
				</div>
				<label for="name">名称:</label> 
				<input class="easyui-textbox" type="text" id="m_names" name="m_name" data-options="required:true"/>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"  onclick="uproles()">修改</a>
			</form>
		</div>
		<!-- 修改子节点对话框 -->
		<div id="updates" class="easyui-dialog" data-options="resizable:true,modal:true,closed:true">
			<form id="up" class="easyui-form">
				<div style="display: none">
					<input class="easyui-textbox" type="text" id="m_id" name="m_id" />
				</div>
				<label for="name">名称:</label> 
				<input class="easyui-textbox" type="text" id="m_name" name="m_name" data-options="required:true"/>
				<label for="name">路径:</label> 
				<input class="easyui-textbox" type="text" id="m_path" name="m_path" data-options="required:true"/>
				<label for="name">权重:</label> 
				<input class="easyui-textbox" type="text" id="m_weight" name="m_weight" data-options="required:true"/>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"  onclick="uprole()">修改</a>
			</form>
		</div>
		
		<!-- 添加子节点对话框 -->
		<div id="inserts" class="easyui-dialog" data-options="resizable:true,modal:true,closed:true">
			<form id="in" class="easyui-form">
				<label for="name">名称:</label> 
				<input class="easyui-textbox" type="text" id="m_namess" data-options="required:true"/><br>
				<label for="name">权重:</label> 
				<input class="easyui-textbox" type="text" id="m_weightss" data-options="required:true" /><br>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="inserts()">添加模块</a>
			</form>
		</div>
		<!-- 添加父节点对话框 -->
		<div id="insertfu" class="easyui-dialog" data-options="resizable:true,modal:true,closed:true">
			<form id="infu" class="easyui-form">
				<label for="name">名称:</label> 
				<input class="easyui-textbox" type="text" id="m_namefus" data-options="required:true"/><br>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'"  onclick="insertfu()">添加模块</a>
			</form>
		</div>
		
</body>
</html>