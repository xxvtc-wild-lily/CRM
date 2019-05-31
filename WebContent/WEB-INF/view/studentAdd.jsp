<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("path",request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/icon.css">
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/default/easyui.css">
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		init()
		$('#lie_window').window({
			onBeforeClose:function(){
				$("#lie_window").dialog("clear");
			}
		});
	})
	function init(){
		$("#stuTab").datagrid({
			url:'selectStudent',
			method:'post',
			pagination:true,
			toolbar:"#studentTb",
			fitColumns:true,
			singleSelect:false,
			idField:"s_id",
			checkbox:true,
			queryParams:{
				e_loginName:'${employee.e_loginName}',
				s_name:$("#s_name").val(),
				s_phone:$("#s_phone").val(),
				a_name:$("#asker.a_name").val(),
				s_isPay:$('#s_isPay').combobox('getValue'),
				s_isValid:$("#s_isValid").combobox('getValue'),
				s_QQ:$("#s_QQ").val(),
				in_s_createTime:$("#in_s_createTime").datebox("getValue"),
				en_s_createTime:$("#en_s_createTime").datebox("getValue")
			},
			 columns:[[
			        {field:'ck',title:'复选框',checkbox:true,width:100},
			        {field:'s_id',title:'编号' ,width:100},
			        {field:'s_name',title:'姓名' ,width:100},
			        {field:'s_age',title:'年龄' ,width:100},
			        {field:'s_importEmployee',title:'录入人'  ,formatter:formattera_name,width:100},
			        {field:'s_sex',title:'性别'  ,formatter:formattresex,width:100},
			        {field:'s_phone',title:'电话'  ,width:100},
			        {field:'s_eduStatus',title:'学历状态',formatter:formatterstu,width:100},
			        {field:'s_perStatus',title:'个人状态' ,formatter:formattergrzt,width:100},
			        {field:'s_comeWay',title:'来源渠道' ,formatter:formatterlyqd,width:100},
			        {field:'s_comeSite',title:'来源网站' ,formatter:formatterlywz,width:100},
			        {field:'s_sourceKeyWord',title:'来源关键词' ,width:100},
			        {field:'s_QQ',title:'QQ' ,width:100},
			        {field:'s_weiXin',title:'微信' ,width:100},
			        {field:'s_remarks',title:'在线备注' ,width:100},
			        {field:'s_createTime',title:'创建时间',width:100},
			        /*{field:'s_isValid',title:'是否有效'  ,formatter:formattersfyx,width:100},
			        {field:'s_isReturnVisit',title:'是否回访'  ,formatter:formattersfhf,width:100}, */
			        {field:'s_focus',title:'学员关注'  ,formatter:formatterxygz,width:100},
			        {field:'s_fromPart',title:'来源部门'  ,formatter:formatterlybm,width:100},
			        {field:'s_isPay',title:'是否付费'  ,formatter:formattersfff,width:100},
			        {field:'s_isReport',title:'是否报备' ,formatter:formattersfbb,width:100},
			        {field:'caozuo',title:'操作'  ,formatter:formattercaozuo,width:100}
			    ]]
		});
		$('#tabfrm').form('clear');
	}
	function formattercaozuo(value,row,index){
	
		return "<a href='javascript:void(0)' onclick='saveStudent("
				+index+")'>查看</a><a href='javascript:void(0)' onclick='tongzhi("
				+index+")'>通知</a>"
	}
	//打开通知对话框
	var tidsss;
	function tongzhi(index){
		var data = $("#stuTab").datagrid("getData");
		tidsss = data.rows[index].s_id;
		$("#tongz").dialog("open");
	}
	function kuaitongzhi(){
		$.post("qutongzhi",{
			tidsss:tidsss,
			name:"${employee.e_loginName}",
			mess:$("#tongzhiinput").val()
		},function(res){
			/* alert(123);
			alert(JSON.stringify(res));
			alert(res.name);
			var s=+","+res.name+","+;
			alert(s);
			var websocket = new WebSocket("ws://localhost:8080/CRM/websocket");
			webscoket.send(s);
			alert("wan") */
		},"json");

		$("#tongzhiForm").form("clear")

		//获取后台消息的方法

		$("#tongz").dialog("close");
	}
	function formattera_name(value,row,index){
		return row.s_importEmployee;
	}
	function formatterlywz(value,row,index) {
		var s_comeSite = "";
		if (row.s_comeSite == "其它") {
			s_comeSite = "其它";
		} else if (row.s_comeSite == "职英B站") {
			s_comeSite = "职英B站";
		} else if (row.s_comeSite == "高考站") {
			s_comeSite = "高考站";
		} else if (row.s_comeSite == "职英A站") {
			s_comeSite = "职英A站";
		} else {
			s_comeSite = "";
		}
		
		return s_comeSite;
		
	}
	function formattergrzt(value,row,index) {
		var s_perStatus = "";
		if (row.s_perStatus == "未知") {
			s_perStatus = "未知";
		} else if (row.s_perStatus == "待业") {
			s_perStatus = "待业";
		} else if (row.s_perStatus == "在职") {
			s_perStatus = "在职";
		} else if (row.s_perStatus == "在读") {
			s_perStatus = "在读";
		} else {
			s_perStatus = "";
		}
		
		return s_perStatus;
		
	}
	function formatterlyqd(value,row,index) {
		var s_comeWay = "";
		if (row.s_comeWay == "未知") {
			s_comeWay = "未知";
		} else if (row.s_comeWay == "百度") {
			s_comeWay = "百度";
		} else if (row.s_comeWay == "百度移动端") {
			s_comeWay = "百度移动端";
		} else if (row.s_comeWay == "360") {
			s_comeWay = "360";
		} else if (row.s_comeWay == "360移动端") {
			s_comeWay = "360移动端";
		} else if (row.s_comeWay == "搜狗") {
			s_comeWay = "搜狗";
		} else if (row.s_comeWay == "搜狗移动端") {
			s_comeWay = "搜狗移动端";
		} else if (row.s_comeWay == "UC移动端") {
			s_comeWay = "UC移动端";
		} else if (row.s_comeWay == "直接输入") {
			s_comeWay = "直接输入";
		} else if (row.s_comeWay == "自然流量") {
			s_comeWay = "自然流量";
		} else if (row.s_comeWay == "直电") {
			s_comeWay = "直电";
		} else if (row.s_comeWay == "微信") {
			s_comeWay = "微信";
		} else if (row.s_comeWay == "QQ") {
			s_comeWay = "QQ";
		} else {
			s_comeWay = "";
		}
		return s_comeWay;
	}
	
	function formattersfff(value,row,index) {
		var s_isPay = "";
		if (row.s_isPay == "0") {
			s_isPay = "未付费";
		} else if (row.s_isPay == "1") {
			s_isPay = "已付费";
		} else {
			s_isPay = "未付费";
		}
		
		return s_isPay;
		
	}
	function formattersfbb(value,row,index) {
		var s_isReport = "";
		if (row.s_isReport == "0") {
			s_isReport = "否";
		} else if (row.s_isReport == "1") {
			s_isReport = "是";
		} else {
			s_isReport = "否";
		}
		
		return s_isReport;
		
	}
	
	function formatterxygz(value,row,index) {
		var s_focus=""
		if (row.s_focus == "课程") {
			s_focus = "课程";
		} else if (row.s_focus == "学费") {
			s_focus = "学费";
		} else if (row.s_focus == "学时") {
			s_focus = "学时";
		} else if (row.s_focus == "学历") {
			s_focus = "学历";
		} else if (row.s_focus == "师资") {
			s_focus = "师资";
		} else if (row.s_focus == "就业") {
			s_focus = "就业";
		} else if (row.s_focus == "环境") {
			s_focus = "环境";
		} else if (row.s_focus == "其他") {
			s_focus = "其他";
		} else {
			s_focus = "";
		}
			
		return s_focus;
	} 
	function formatterlybm(value,row,index) {
		var s_fromPart=""
		if (row.s_fromPart == "网络") {
			s_fromPart = "网络";
		} else if (row.s_fromPart == "市场") {
			s_fromPart = "市场";
		} else if (row.s_fromPart == "教质") {
			s_fromPart = "教质";
		} else if (row.s_fromPart == "学术") {
			s_fromPart = "学术";
		} else if (row.s_fromPart == "就业") {
			s_fromPart = "就业";
		} else {
			s_fromPart = "";
		}
				
		return s_fromPart;
	}
	function formattresex(value,row,index) {
		var sex = "";
		if (row.s_sex == "0") {
			sex = "女";
		} else if (row.s_sex == "1") {
			sex = "男";
		} else {
			sex = "";
		}
		
		return sex;
	}
	function formatterstu(value,row,index) {
		var s_eduStatus = "";
		if (row.s_eduStatus == "") {
			s_eduStatus = "";
		}else if (row.s_eduStatus == "未知") {
			s_eduStatus = "未知";
		}else if (row.s_eduStatus == "初中") {
			s_eduStatus = "初中";
		}else if (row.s_eduStatus == "中专") {
			s_eduStatus = "中专";
		} else if (row.s_eduStatus == "高中") {
			s_eduStatus = "高中";
		}else if (row.s_eduStatus == "大专") {
			s_eduStatus = "大专";
		} else if(row.s_eduStatus == "本科"){
			s_eduStatus = "本科";
		}else{
			s_eduStatus = "其他";
		}
		
		return s_eduStatus;
	}
	
	function addStudent(){
		$("#addDialog").dialog("open");
	}
	
	function addSave(){
		
		$.post("insertStudent",{
			s_name:$("#adds_name").val(),
			s_sex:$("#adds_sex").combobox("getValue"),
			s_age:$("#adds_age").val(),
			s_importEmployee:'${employee.e_loginName}', 
			s_phone:$("#adds_phone").val(),
			s_eduStatus:$("#adds_eduStatus").combobox("getValue"),
			s_perStatus:$("#adds_perStatus").val(),
			s_comeWay:$("#adds_comeWay").val(),
			s_comeSite:$("#adds_comeSite").val(),
			s_sourceKeyWord:$("#adds_sourceKeyWord").val(),
			s_QQ:$("#adds_QQ").val(),
			s_weiXin:$("#adds_weiXin").val(),
			s_isReport:$("#adds_isReport").val(),
			s_createTime:$("#adds_createTime").val(),
			s_remarks:$("#adds_remarks").val()
		},function(res){
			if(res>0){
				$.messager.alert("提示","添加成功！！！","info");
				$("#addDialog").dialog("close");
				$("#stuTab").datagrid("reload");
			}else{
				$.messager.alert("提示","添加失败！！！","error");
			}
		},"json")
		
		$("#addForm").form("clear");
	}
	function addClose(){
		$("#addDialog").dialog("close");
	}
	
	
	
	function saveStudent(index){
		var data=$("#stuTab").datagrid("getData");
		var row=data.rows[index];
		$("#s_sex").textbox('setValue',row.s_sex == 0? '女':'男');
		$("#s_isValid").textbox('setValue',row.s_isValid == 0? '无效':'有效');
		$("#s_isReturnVisit").textbox('setValue',row.s_isReturnVisit == 0? '未回访':'已回访');
		$("#s_isInClass").textbox('setValue',row.s_isInClass == 0? '未进班':'已进班');
		$("#s_isReport").textbox('setValue',row.s_isReport == 0? '未报备':'已报备');
		$("#detailForm").form("load",row);
		$("#detailDialog").dialog("open");
	}
	function detailClose(){
		$("#detailDialog").dialog("close");
	}
	
	function show(){
        var datagridTitle = new Array();
        var shuxing = new Array();
        var fields = $("#stuTab").datagrid('getColumnFields');
        var option;
             for (var i = 0; i < fields.length; i++) {
                option = $("#stuTab").datagrid('getColumnOption', fields[i]);
                datagridTitle.push(option.title);
                shuxing.push(option.field);
               if (option.field != "checked" && option.hidden != true) { 
            		$("#lie_window").append("<input type='checkbox' value="+shuxing[i]+"  name='ch'>"+datagridTitle[i]+"</br>");
                    $("input[name='ch']").get(i).checked=true;
                }else{
                    $("#lie_window").append("<input type='checkbox' value="+shuxing[i]+" name='ch' >"+datagridTitle[i]);
                } 
            }
        $("#lie_window").window("open");
        $("input[name='ch']").click(function(){
                if($(this).is(":checked")){
                    var p = $(this).val();
                    $("#stuTab").datagrid('showColumn',p);
                }else{
                    var q = $(this).val();
                    $("#stuTab").datagrid('hideColumn',q);
                }
        })
    }
	
</script>
</head>
<body>
	<table id="stuTab" ></table>
	<div id="studentTb">
		<form  id="tabfrm" class="easyui-form">
	        <label for="name">姓名:</label>   
	        <input class="easyui-textbox" type="text"  id="s_name"/>  
	        <label for="name">电话:</label>   
	        <input class="easyui-textbox" type="text"  id="s_phone"/>
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
	        <input class="easyui-datebox" type="text"  id="in_s_createTime"/>~
	        <input class="easyui-datebox" type="text"  id="en_s_createTime"/>
	        
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
			<a href="javascript:void(0)" onclick="addStudent()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">创建</a>
			<a href="javascript:void(0)" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
			<a href="javascript:void(0)" onclick="show()" class="easyui-linkbutton">设置</a>
		</form>
	</div>
	<div id="lie_window" class="easyui-dialog" title="列设置" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:400px;height:500px;padding:10px;">
         
    </div>
	
	<div id="addDialog" class="easyui-dialog" title="创建" style="width:700px;height:300px;"  data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<form id="addForm" method="post">   
			<table>
			    <tr>
			        <td><label>姓名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_name" name="s_name" data-options="required:true"/></td>
			   
			        <td><label>性别：</label></td>
			        <td>
				        <select class="easyui-combobox" style="width:100px;" id="adds_sex" name="s_sex">   
						    <option value="">--请选择--</option>   
						    <option value="0">女</option>   
						    <option value="1">男</option>     
						</select> 
					</td> 
			    
			        <td><label>年龄：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_age" name="s_age" /></td>
			    </tr>
			    <tr>
			
			        <td><label>电话：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_phone" name="s_phone"/></td>

			        <td><label>状态：</label></td>
			   		<td>
			        	<select class="easyui-combobox" style="width:100px;" id="adds_perStatus" name="s_perStatus">   
						    <option value="">--请选择--</option> 
						    <option value="未知">未知</option>     
						    <option value="待业">待业</option>
							<option value="在职">在职</option>
						    <option value="在读">在读</option>
						</select>
			        </td>
			        <td><label>来源渠道：</label></td>
			    	<td>
			        	<select class="easyui-combobox" style="width:100px;" id="adds_comeWay" name="s_comeWay">   
						    <option value="">--请选择--</option> 
						    <option value="未知">未知</option>     
						    <option value="百度">百度</option>
							<option value="百度移动端">百度移动端</option>
						    <option value="360">360</option>
						    <option value="360移动端">360移动端</option>     
						    <option value="搜狗">搜狗</option>
							<option value="搜狗移动端">搜狗移动端</option>
						    <option value="UC移动端">UC移动端</option>
						    <option value="直接输入">直接输入</option>     
						    <option value="自然流量">自然流量</option>
							<option value="直电">直电</option>
						    <option value="微信">微信</option>
						    <option value="QQ">QQ</option>
						</select>
			        </td>
			    </tr>
			    <tr>
			        <td><label>来源网站：</label></td>
			   		<td>
			        	<select class="easyui-combobox" style="width:100px;" id="adds_comeSite" name="s_comeSite">   
						    <option value="">--请选择--</option> 
						    <option value="其它">其它</option>     
						    <option value="职英B站">职英B站</option>
							<option value="高考站">高考站</option>
						    <option value="职英A站">职英A站</option>
						</select>
			        </td>
			        <td><label>来源关键词：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_sourceKeyWord" name="s_sourceKeyWord"/></td>
			   
			        <td><label>学员QQ：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_QQ" name="s_QQ"/></td>
			     </tr>
			    <tr>
			        <td><label>微信号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_weiXin" name="s_weiXin"/></td>
			    
			    	<td><label>学历：</label></td>
			        <td>
			        	<select class="easyui-combobox" style="width:100px;" id="adds_eduStatus" name="s_eduStatus">   
						    <option value="">--请选择--</option> 
						    <option value="未知">未知</option>     
						    <option value="初中">初中</option>
							<option value="中专">中专</option>
						    <option value="高中">高中</option>
						    <option value="大专">大专</option>
						    <option value="本科">本科</option>
						    <option value="其他">其他</option>    
						</select>
			        </td>
			        
			        <td><label>是否报备：</label></td>
			    	<td>
			        	<select class="easyui-combobox" style="width:100px;" id="adds_isReport" name="s_isReport">   
						    <option value="">--请选择--</option> 
						    <option value="0">否</option>     
						    <option value="1">是</option>
							   
						</select>
			        </td>
			    </tr>
			    <tr>
			        <td><label>在线备注：</label></td>
			        <td><input class="easyui-textbox" type="text" id="adds_remarks" name="s_remarks"/></td>
			        
			    </tr>
			    
			    <tr Style="text-align:right">
			    	<td></td>
			    	<td></td>
			    	<td></td>
			    	<td></td>
			    	<td></td>
			    	<td >
			    		<a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="addSave()">添加</a><a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="addClose()">关闭</a>
			    	</td>
			    </tr>
		    </table>
		</form>  
	</div>
	
	<div id="detailDialog" class="easyui-dialog" title="查看信息"  style="width:700px; height:300px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
		<form id="detailForm" method="post">
			<table>
				<tr>
					<td><label>学生编号：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_id" name="s_id" data-options="readonly:true" /></td>
				
					<td><label>学生姓名：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_name" name="s_name" data-options="readonly:true" /></td>
				
					<td><label>年龄：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_age" name="s_age" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>性别：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_sex" data-options="readonly:true" /></td>
				
					<td><label>电话：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_phone" name="s_phone" data-options="readonly:true" /></td>
				
					<td><label>学历：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_eduStatus" name="s_eduStatus" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>个人状态：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_perStatus" name="s_perStatus" data-options="readonly:true" /></td>
				
					<td><label>来源渠道：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_comeWay" name="s_comeWay" data-options="readonly:true" /></td>
				
					<td><label>来源网站：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_comeSite" name="s_comeSite" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>来源关键词：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_sourceKeyWord" name="s_sourceKeyWord" data-options="readonly:true" /></td>
				
					<td><label>地址：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_address" name="s_address" data-options="readonly:true" /></td>
				
					<td><label>咨询师：</label></td>
					<td><input class="easyui-textbox" type="text" id="asker.a_name" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>QQ：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_QQ" name="s_QQ" data-options="readonly:true" /></td>
				
					<td><label>微信：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_weiXin" name="s_weiXin" data-options="readonly:true" /></td>
					
					<td><label>来源部门：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_fromPart" name="s_fromPart" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>学员关注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_focus" name="s_focus" data-options="readonly:true" /></td>
				
					
					<td><label>是否报备：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isReport" data-options="readonly:true" /></td>
				
					<td><label>录入人：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_importEmployee" name="s_importEmployee" data-options="readonly:true" /></td>
				</tr>
				
				<tr></tr>
				<tr Style="text-align:right">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="detailClose()" >关闭</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">

	
	function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
		//如果jsondata不是对象，那么json.parse将分析对象中的json字符串。
		var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData)
				: JSONData;
		
		var sele=$("#stuTab").datagrid('getSelections');
        if(sele!=""){
		var CSV = '';
		//在第一行拼接标题
		CSV += ReportTitle + '\r\n\n';

		//产生数据标头
		if (ShowLabel) {
			var row = "";
			
			//此循环将从数组的第一个索引中提取标签
			for ( var index in arrData[0]) {
				//现在将每个值转换为字符串和逗号分隔
				row += index + ',';
			}
			row = row.slice(0, -1);
			
			//添加带换行符的标签行
			CSV += row + '\r\n';
		}
		//第一个循环是提取每一行
		for (var i = 0; i < sele.length; i++) {
			var row = "";
			for ( var index in sele[i]) {
				row += '"' + sele[i][index] + '",';
			}
			row.slice(0, row.length - 1);
			CSV += row + '\r\n';
		}
		if (CSV == '') {
			alert("Invalid data");
			return;
		}
		var fileName = "我的学生_";
		fileName += ReportTitle.replace(/ /g, "_");
		var uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURI(CSV);
		var link = document.createElement("a");
		link.href = uri;
		link.style = "visibility:hidden";
		link.download = fileName + ".csv";
		document.body.appendChild(link);
		link.click();
		document.body.removeChild(link);
        }else{
        	$.messager.alert("提示","请选择需要导出的学生")
        }
	}
	$("#btnExport").click(function() {
		var data = JSON.stringify($('#stuTab').datagrid('getData').rows);
		if (data == '')
			return;
		JSONToCSVConvertor(data, "数据信息", true);
	});
</script>
<div id="tongz" class="easyui-dialog" title="通知"  style="width:700px; height:300px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
		<form id="tongzhiForm" >

				<input class="easyui-textbox" type="text" id="tongzhiinput" name="tongzhiinput" />

				<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="kuaitongzhi()" >通知</a>
		</form>
</div>
</body>
</html>