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
	$(function(){
		init()
	})
	function init(){
		$("#stuTab").datagrid({
			url:'../selectStudent',
			method:'post',
			pagination:true,
			singleSelect:true,
			toolbar:"#studentTb",
			queryParams:{
				s_name:$("#s_name").val(),
				s_phone:$("#s_phone").val(),
				a_name:$("#asker.a_name").val(),
				s_isPay:$('#s_isPay').combobox('getValue'),
				s_isValid:$("#s_isValid").combobox('getValue'),
				s_QQ:$("#s_QQ").val(),
				s_createTime:$("#s_createTime").val()
			}
		});
		$('#tabfrm').form('clear');
	}
	function formattercaozuo(value,row,index){
		
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='deleteStudent("+index+")'>删除</a>"
	}
	
	function formattera_name(value,row,index){
		return row.asker.a_name;
	}
	function formattersfff(value,row,index) {
		return value==0? '未付费':'已付费';
	} 
	function formattersfyx(value,row,index) {
		return value==0? '无效':'有效';
	} 
	
	function addStudent(){
		$("#addDialog").dialog("open");
	}
	
	function addSave(){
		$.post("../insertStudent",{
			s_name:$("#adds_name").val(),
			s_sex:$("#adds_sex").combobox("getValue"),
			s_age:$("#adds_age").val(),
			s_askerId:$("#adds_askerId").val(),
			s_phone:$("#adds_phone").val(),
			s_eduStatus:$("#adds_eduStatus").combobox("getValue"),
			s_perStatus:$("#adds_perStatus").val(),
			s_comeWay:$("#adds_comeWay").val(),
			s_comeSite:$("#adds_comeSite").val(),
			s_sourceKeyWord:$("#adds_sourceKeyWord").val(),
			s_QQ:$("#adds_QQ").val(),
			s_weiXin:$("#adds_weiXin").val(),
			s_isReport:$("#adds_isReport").val(),
			s_remarks:$("#adds_remarks").val()	
		},function(res){
			if(res>0){
				$.messager.alert("提示","添加成功！！！","info");
				$("addDialog").dialog("close");
				$("#stuTab").datagrid("reload");
			}else{
				$.messager.alert("提示","添加失败！！！","error");
			}
		},"json")
		
		$("addForm").form("clear");
	}
	
	function formattresex(value,row,index) {
		return value==0? '女':'男';
	}
	
</script>
</head>
<body>
	<table id="stuTab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'s_id',title:'编号'  "></th>
				<th data-options="field:'s_name',title:'姓名'  "></th>
				<th data-options="field:'s_age',title:'年龄'  "></th>
				<th data-options="field:'asker.a_name',title:'咨询师' ,formatter:formattera_name"></th>
				<th data-options="field:'s_sex',title:'性别'  ,formatter:formattresex"></th>
				<th data-options="field:'s_phone',title:'电话'  "></th>
				<th data-options="field:'s_eduStatus',title:'学历状态' "></th>
				<th data-options="field:'s_perStatus',title:'个人状态'  "></th> 
				<th data-options="field:'s_comeWay',title:'来源渠道'  "></th>
				<th data-options="field:'s_comeSite',title:'来源网站'  "></th>
				<th data-options="field:'s_sourceKeyWord',title:'来源关键词'  "></th>
				<th data-options="field:'s_QQ',title:'QQ' "></th>
				<th data-options="field:'s_weiXin',title:'微信'  "></th>
				<th data-options="field:'s_remarks',title:'在线备注'  "></th>
				<th data-options="field:'s_isValid',title:'是否有效'  ,formatter:formattersfyx"></th>
				<th data-options="field:'s_isReturnVisit',title:'是否回访'  "></th>
				<th data-options="field:'s_isPay',title:'是否付费'  ,formatter:formattersfff"></th>
				<th data-options="field:'s_isReport',title:'是否报备'  "></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
			</tr>
		</thead>
	</table>
	<div id="studentTb">
		<form  id="tabfrm" class="easyui-form">
	        <label for="name">姓名:</label>   
	        <input class="easyui-textbox" type="text"  id="s_name"/>  
	        <label for="name">电话:</label>   
	        <input class="easyui-textbox" type="text"  id="s_phone"/>
	        <label for="name">咨询师:</label>   
	        <input class="easyui-textbox" type="text"  id="asker.a_name"/>
	        <label for="name">是否付费:</label>   
	        <select id="s_isPay" class="easyui-combobox" style="width:100px;">   
			    <option value="">--请选择--</option>   
			    <option value="0">未付费</option>   
			    <option value="1">已付费</option>     
			</select>
	        <label for="name">是否有效:</label>   
	        <select id="s_isValid" class="easyui-combobox" style="width:100px;">   
			    <option value="">--请选择--</option>   
			    <option value="0">无效</option>   
			    <option value="1">有效</option>     
			</select>
	        <label for="name">QQ:</label>   
	        <input class="easyui-textbox" type="text"  id="s_QQ"/> 
	         <label for="name">创建时间:</label>   
	        <input class="easyui-datebox" type="text"  id="s_createTime"/>
	        
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
			<a href="javascript:void(0)" onclick="addStudent()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">创建</a>
		</form>
	</div>
	
	
	<div id="addDialog" class="easyui-dialog" title="创建" style="width:400px;height:400px;"  data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<form id="addForm" method="post">   
			<table>
			    <tr>
			        <td><label>姓名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_name" name="s_name"/></td>
			    </tr>
			    <tr>
			        <td><label>性别：</label></td>
			        <td>
				        <select class="easyui-combobox" style="width:100px;" id="adds_sex" name="s_sex">   
						    <option value="">--请选择--</option>   
						    <option value="0">女</option>   
						    <option value="1">男</option>     
						</select> 
					</td> 
			    </tr>
			 	<tr>
			        <td><label>年龄：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_age" name="s_age"/></td>
			    </tr>
			    <tr>
			        <td><label>咨询师：</label></td>
			        <td>
			        	<select class="easyui-combobox" style="width:100px;" id="adds_askerId" name="s_askerId">   
						    <option value="">--请选择--</option>      
						    <option value="0">1</option> 
						    <option value="1">2</option>
						    <option value="2">3</option>
						    <option value="3">4</option>    
						</select>
			        </td>
			    </tr>
			    <tr>
			        <td><label>电话：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_phone" name="s_phone"/></td>
			    </tr>
			    <tr>
			        <td><label>学历：</label></td>
			        <td>
			        	<select class="easyui-combobox" style="width:100px;" id="adds_eduStatus" name="s_eduStatus">   
						    <option value="">--请选择--</option>      
						    <option value="0">初中</option> 
						    <option value="1">高中</option>
						    <option value="2">大专</option>
						    <option value="3">本科</option>    
						</select>
			        </td>
			    </tr>
			    <tr>
			        <td><label>状态：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_perStatus" name="s_perStatus"/></td>
			    </tr>
			    <tr>
			        <td><label>来源渠道：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_comeWay" name="s_comeWay"/></td>
			    </tr>
			    <tr>
			        <td><label>来源网站：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_comeSite" name="s_comeSite"/></td>
			    </tr>
			    <tr>
			        <td><label>来源关键词：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_sourceKeyWord" name="s_sourceKeyWord"/></td>
			    </tr>
			    <tr>
			        <td><label>学员QQ：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_QQ" name="s_QQ"/></td>
			    </tr>
			    <tr>
			        <td><label>微信号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_weiXin" name="s_weiXin"/></td>
			    </tr>
			    <tr>
			        <td><label>是否报备：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_isReport" name="s_isReport"/></td>
			    </tr>
			    <tr>
			        <td><label>在线备注：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_remarks" name="s_remarks"/></td>
			    </tr>
			    
			    <tr>
			    	<td>
			    		<a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="addSave()">保存</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="addClose()">关闭</a>
			    	</td>
			    </tr>
		    </table>
		</form>  
	</div>
	
</body>
</html>