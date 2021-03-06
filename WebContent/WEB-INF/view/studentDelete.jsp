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
				checkbox: true,
				queryParams:{
					e_loginName:"${employee.e_loginName}",
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
				        {field:'asker.a_name',title:'咨询师'  ,formatter:formattera_name,width:100},
				        {field:'s_sex',title:'性别'  ,formatter:formattresex,width:100},
				        {field:'s_phone',title:'电话'  ,width:100},
				        {field:'s_eduStatus',title:'学历状态',width:100},
				        {field:'s_perStatus',title:'个人状态' ,width:100},
				        {field:'s_comeWay',title:'来源渠道',width:100},
				        {field:'s_comeSite',title:'来源网站' ,width:100},
				        {field:'s_sourceKeyWord',title:'来源关键词' ,width:100},
				        {field:'s_QQ',title:'QQ' ,width:100},
				        {field:'s_weiXin',title:'微信' ,width:100},
				        {field:'s_remarks',title:'在线备注' ,width:100},
				        {field:'s_createTime',title:'创建时间',width:100},
				        {field:'s_isValid',title:'是否有效'  ,formatter:formattersfyx,width:100},
				        {field:'s_isReturnVisit',title:'是否回访'  ,formatter:formattersfhf,width:100},
				        {field:'s_isPay',title:'是否付费'  ,formatter:formattersfff,width:100},
				        {field:'s_isReport',title:'是否报备' ,width:100},
				        {field:'caozuo',title:'操作'  ,formatter:formattercaozuo,width:100}
				    ]]
			});
			$('#tabfrm').form('clear');
		}
		function formattercaozuo(value,row,index){
			
			return "<a href='javascript:void(0)' onclick='saveStudent("+index+")'>查看</a>  <a href='javascript:void(0)' onclick='deleteStudent("+index+")'>无效</a>"
		}
		
		function formattera_name(value,row,index){
	        if (row.s_askerId == null) {
	            return "暂未分配";
	        }
	        return row.asker.a_name;
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
		function formattersfyx(value,row,index) {
			var s_isValid=""
			if (row.s_isValid == "0") {
				s_isValid = "无效";
			} else if (row.s_isValid == "1") {
				s_isValid = "有效";
			} else {
				s_isValid = "待定";
			}
				
			return s_isValid;
		} 
		function formattersfhf(value,row,index) {
			var s_isReturnVisit=""
			if (row.s_isReturnVisit == "0") {
				s_isReturnVisit = "未回访";
			} else if (row.s_isReturnVisit == "1") {
				s_isReturnVisit = "已回访";
			} else {
				s_isReturnVisit = "未回访";
			}
					
			return s_isReturnVisit;
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
		
		function deleteStudent(index){
			var data=$("#stuTab").datagrid("getData");
			var row=data.rows[index];
			$.messager.confirm('确认','您确定要将该学生变为无效状态吗？',function(r){    
			    if (r){    
			          $.post("deleteStudent",{s_id:row.s_id},function(res){
			        	  if(res>0){
			        		  $("#stuTab").datagrid("reload");
			        		  $.messager.alert('确认','修改成功！',"info");
			        	  }else{
			        		  $.messager.alert('确认','修改失败！',"error");
			        	  }
			          },"json")  
			    }    
			});  

		}
		function saveStudent(index){
			var data=$("#stuTab").datagrid("getData");
			var row=data.rows[index];
			$("#s_sex").textbox('setValue',row.s_sex == 0? '女':'男');
			$("#s_isValid").textbox('setValue',row.s_isValid == 0? '无效':'有效');
			$("#s_isReturnVisit").textbox('setValue',row.s_isReturnVisit == 0? '未回访':'已回访');
			$("#s_isHome").textbox('setValue',row.s_isHome == 0? '未上门':'已上门');
			$("#s_isPay").textbox('setValue',row.s_isPay == 0? '未付费':'已付费');
			$("#s_isReturnMoney").textbox('setValue',row.s_isReturnMoney == 0? '否':'是');
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
	               if (option.field != "checkItem" && option.hidden != true) { 
	                    $("#lie_window").append("<input type='checkbox' value="+shuxing[i]+"  name='ch'>"+datagridTitle[i]+"</br>");
	                    $("input[name='ch']").get(i).checked=true;
	                }else{
	                    $("#lie_window").append("<input type='checkbox' value="+shuxing[i]+" name='ch' >"+datagridTitle[i]+"</br>");
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
	<table id="stuTab"></table>
	<div id="studentTb">
		<form  id="tabfrm" class="easyui-form">
	        <label for="name">姓名:</label>   
	        <input class="easyui-textbox" type="text"  id="s_name"/>  &ensp;
	        <label for="name">电话:</label>   
	        <input class="easyui-textbox" type="text"  id="s_phone"/>&ensp;
	        <label for="name">咨询师:</label>   
	        <input class="easyui-textbox" type="text"  id="asker.a_name"/>&ensp;
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
	        <input class="easyui-textbox" type="text"  id="s_QQ"/> &ensp;
	        <label for="name">创建时间:</label>   
	        <input class="easyui-datebox" type="text"  id="in_s_createTime"/>~
	        <input class="easyui-datebox" type="text"  id="en_s_createTime"/>
	        
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
			<a href="javascript:void(0);" id="btnExport" class="easyui-linkbutton" iconCls='icon-print'>导出Excel</a>
			<a href="javascript:void(0)" onclick="show()" class="easyui-linkbutton">动态设置</a>
		</form>
	</div>
	<div id="lie_window" class="easyui-dialog" title="列设置" data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:400px;height:500px;padding:10px;">
         
    </div>
	
	<div id="detailDialog" class="easyui-dialog" title="查看信息"  style="width:1000px; height:440px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
		<form id="detailForm" method="post">
			<table>
				<tr>
					<td><label>学生编号：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_id" name="s_id" data-options="readonly:true" /></td>
				
					<td><label>学生姓名：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_name" name="s_name" data-options="readonly:true" /></td>
				
					<td><label>年龄：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_age" name="s_age" data-options="readonly:true" /></td>
				
					<td><label>性别：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_sex" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>电话：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_phone" name="s_phone" data-options="readonly:true" /></td>
				
					<td><label>学历：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_eduStatus" name="s_eduStatus" data-options="readonly:true" /></td>
				
					<td><label>个人状态：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_perStatus" name="s_perStatus" data-options="readonly:true" /></td>
				
					<td><label>来源渠道：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_comeWay" name="s_comeWay" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>来源网站：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_comeSite" name="s_comeSite" data-options="readonly:true" /></td>
				
					<td><label>来源关键词：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_sourceKeyWord" name="s_sourceKeyWord" data-options="readonly:true" /></td>
				
					<td><label>地址：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_address" name="s_address" data-options="readonly:true" /></td>
				
					<td><label>咨询师：</label></td>
					<td>
						<input class="easyui-textbox" type="text" id="asker.a_name" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>QQ：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_QQ" name="s_QQ" data-options="readonly:true" /></td>
				
					<td><label>微信：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_weiXin" name="s_weiXin" data-options="readonly:true" /></td>
				
					<td><label>在线备注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_remarks" name="s_remarks" data-options="readonly:true" /></td>
				
					<td><label>创建时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_createTime" name="s_createTime" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>课程方向：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_learnForward" name="s_learnForward" data-options="readonly:true" /></td>
				
					<td><label>是否有效：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isValid" data-options="readonly:true" /></td>
				
					<td><label>打分：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_record" name="s_record" data-options="readonly:true" /></td>
				
					<td><label>是否回访：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isReturnVisit" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>首次回访时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_firstVisitTime" name="s_firstVisitTime" data-options="readonly:true" /></td>
				
					<td><label>是否上门：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isHome" data-options="readonly:true" /></td>
				
					<td><label>上门时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_homeTime" name="s_homeTime" data-options="readonly:true" /></td>
				
					<td><label>无效原因：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_lostReason" name="s_lostReason" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>是否付费：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isPay" data-options="readonly:true" /></td>
				
					<td><label>付费时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_payTime" name="s_payTime" data-options="readonly:true" /></td>
				
					<td><label>金额：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_payMoney" name="s_payMoney" data-options="readonly:true" /></td>
				
					<td><label>是否退费：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isReturnMoney" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>是否进班：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isInClass" data-options="readonly:true" /></td>
				
					<td><label>进班时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_inClassTime" name="s_inClassTime" data-options="readonly:true" /></td>
				
					<td><label>进班备注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_inClassRemarks" name="s_inClassRemarks" data-options="readonly:true" /></td>
				
					<td><label>咨询师备注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_askerRemarks" name="s_askerRemarks" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>来源部门：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_fromPart" name="s_fromPart" data-options="readonly:true" /></td>
				
					<td><label>学员关注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_focus" name="s_focus" data-options="readonly:true" /></td>
				
					<td><label>是否报备：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isReport" data-options="readonly:true" /></td>
				
					<td><label>录入人：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_importEmployee" name="s_importEmployee" data-options="readonly:true" /></td>
				</tr>
				<tr>
					<td><label>退费原因：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_returnMoneyReason" name="s_returnMoneyReason" data-options="readonly:true" /></td>
				
					<td><label>定金：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_preMoney" name="s_preMoney" data-options="readonly:true" /></td>
				
					<td><label>定金时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_preMoneyTime" name="s_preMoneyTime" data-options="readonly:true" /></td>
				</tr>
				<tr></tr>
				<tr Style="text-align:right">
					<td></td>
					<td></td>
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
</body>
</html>