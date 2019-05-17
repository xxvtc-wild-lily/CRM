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
		
		return "<a href='javascript:void(0)' onclick='saveStudent("+index+")'>查看</a> <a href='javascript:void(0)' onclick='updateStudent("+index+")'>修改</a>"
	}
	
	function formattera_name(value,row,index){
		return row.asker.a_name;
	}
	function formattersfff(value,row,index) {
		return value==0? '未付费':'已付费';
	} 
	function formattersfhf(value,row,index) {
		return value==0? '未回访':'已回访';
	}
	function formattersfyx(value,row,index) {
		return value==0? '无效':'有效';
	} 
	function formattresex(value,row,index) {
		return value==0? '女':'男';
	} 
	
	function updateStudent(index){
		var data=$("#stuTab").datagrid("getData");
		var row=data.rows[index];
		$('#updateForm').form('load',row);
		$("#updateDialog").dialog("open");
	}
	function updateSave(){
		$.post("../updateStudent",{
			s_id:$("#updates_id").val(),
			s_name:$("#updates_name").val(),
			s_sex:$("#updates_sex").val(),
			s_age:$("#updates_age").val(),
			s_phone:$("#updates_phone").val(),
			a_name:$("#updatea_name").val(),
			s_eduStatus:$("#updates_eduStatus").val(),
			s_perStatus:$("#updates_perStatus").val(),
			s_comeWay:$("#updates_comeWay").val(),
			s_comeSite:$("#updates_comeSite").val(),
			s_sourceKeyWord:$("#updates_sourceKeyWord").val(),
			s_fromPart:$("#updates_fromPart").val(),
			s_address:$("#updates_address").val(),
			s_focus:$("#updates_focus").val(),
			s_QQ:$("#updates_QQ").val(),
			s_weiXin:$("#updates_weiXin").val(),
			s_isReport:$("#updates_isReport").val(),
			s_importEmployee:$("#updates_importEmployee").val(),
		},function(res){
			
			if(res>0){
				$.messager.alert("提示","修改成功！","info");
				$("#updateDialog").dialog("close");
				$("#stuTab").datagrid("reload");
			}else{
				$.messager.alert("提示","修改失败！","error");
				
			}
		},"json")
		$('#updateForm').form('clear');
	}
	function updateClose(){
		$("#updateDialog").dialog("close");
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
</script>
</head>
<body>
	<table id="stuTab" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true "></th>
				<th data-options="field:'s_id',title:'编号'  "></th>
				<th data-options="field:'s_name',title:'姓名'  "></th>
				<th data-options="field:'s_age',title:'年龄'  "></th>
				<th data-options="field:'s_askerId',title:'咨询师'  ,formatter:formattera_name"></th>
				<th data-options="field:'s_sex',title:'性别'  ,formatter:formattresex"></th>
				<th data-options="field:'s_phone',title:'电话'  "></th>
				<th data-options="field:'s_eduStatus',title:'学历状态'  "></th>
				<th data-options="field:'s_perStatus',title:'个人状态'  "></th> 
				<th data-options="field:'s_comeWay',title:'来源渠道'  "></th>
				<th data-options="field:'s_comeSite',title:'来源网站'  "></th>
				<th data-options="field:'s_sourceKeyWord',title:'来源关键词'  "></th>
				<th data-options="field:'s_QQ',title:'QQ' "></th>
				<th data-options="field:'s_weiXin',title:'微信'  "></th>
				<th data-options="field:'s_remarks',title:'在线备注'  "></th>
				<th data-options="field:'s_isValid',title:'是否有效'  ,formatter:formattersfyx"></th>
				<th data-options="field:'s_isReturnVisit',title:'是否回访'  ,formatter:formattersfhf "></th>
				<th data-options="field:'s_isPay',title:'是否付费'  ,formatter:formattersfff"></th>
				<th data-options="field:'s_isReport',title:'是否报备'  "></th>
				<th data-options="field:'caozuo',title:'操作'  ,formatter:formattercaozuo"></th>
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
		</form>
	</div>
	<div id="updateDialog" class="easyui-dialog" title="修改  " style="width:400px;height:500px;"  data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<form id="updateForm" method="post">   
			<table>
				<tr>
			        <td><label>学生编号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_id" name="s_id" data-options="disabled:true"/></td>
			    </tr>
			    <tr>
			        <td><label>学生姓名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_name" name="s_name" /></td>
			    </tr>
			    <tr>
			        <td><label>性别：</label></td>
			        <td>
				        <select class="easyui-combobox" style="width:100px;" id="updates_sex" name="s_sex">   
						    <option value="">--请选择--</option>   
						    <option value="0">女</option>   
						    <option value="1">男</option>     
						</select> 
					</td> 
			    </tr>
			 	<tr>
			        <td><label>年龄：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_age" name="s_age"/></td>
			    </tr>
			    <tr>
			        <td><label>电话：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_phone" name="s_phone"/></td>
			    </tr>
			    <tr>
			        <td><label>咨询师：</label></td>
			        <td>
			        	<select class="easyui-combobox" style="width:100px;" id="updatea_name" name="a_name">   
						    <option value="">--请选择--</option>      
						    <option value="0">1234</option> 
						    <option value="1">12345</option>
						    <option value="2">1231231</option>
						    <option value="3">12312311</option> 
						    <option value="4">123123123131</option>    
						</select>
			        </td>
			    </tr>
			    
			    <tr>
			        <td><label>学历：</label></td>
			        <td>
			        	<select class="easyui-combobox" style="width:100px;" id="updates_eduStatus" name="s_eduStatus">   
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
			        <td><input class="easyui-textbox" type="text" id="updates_perStatus" name="s_perStatus"/></td>
			    </tr>
			    <tr>
			        <td><label>来源渠道：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_comeWay" name="s_comeWay"/></td>
			    </tr>
			    <tr>
			        <td><label>来源网站：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_comeSite" name="s_comeSite"/></td>
			    </tr>
			    <tr>
			        <td><label>来源关键词：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_sourceKeyWord" name="s_sourceKeyWord"/></td>
			    </tr>
			    <tr>
			        <td><label>来源部门：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_fromPart" name="s_fromPart"/></td>
			    </tr>
			    <tr>
			        <td><label>地址：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_address" name="s_address"/></td>
			    </tr>
			    <tr>
			        <td><label>学员关注：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_focus" name="s_focus"/></td>
			    </tr>
			    <tr>
			        <td><label>学员QQ：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_QQ" name="s_QQ"/></td>
			    </tr>
			    <tr>
			        <td><label>微信号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_weiXin" name="s_weiXin"/></td>
			    </tr>
			    <tr>
			        <td><label>是否报备：</label></td>
			        <td>
			    		<select class="easyui-combobox" style="width:100px;" id="updates_isReport" name="s_isReport">   
						    <option value="">--请选择--</option>   
						    <option value="0">否</option>   
						    <option value="1">是</option>     
						</select> 
					</td>
			    </tr>
			    <tr>
			        <td><label>录入人：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updates_importEmployee" name="s_importEmployee"/></td>
			    </tr>
			    <tr>
			    	<td>
			    		<a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="updateSave()">保存</a>
			    		<a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="updateClose()">关闭</a>
			    	</td>
			    </tr>
		    </table>
		</form>  
	</div>
	<div id="detailDialog" class="easyui-dialog" title="查看信息"  style="width:400px; height:400px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true" >
		<form id="detailForm" method="post">
			<table>
				<tr>
					<td><label>学生编号：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_id" name="s_id" /></td>
				</tr>
				<tr>
					<td><label>学生姓名：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_name" name="s_name" /></td>
				</tr>
				<tr>
					<td><label>年龄：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_age" name="s_age" /></td>
				</tr>
				<tr>
					<td><label>性别：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_sex" /></td>
				</tr>
				<tr>
					<td><label>电话：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_phone" name="s_phone" /></td>
				</tr>
				<tr>
					<td><label>学历：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_eduStatus" name="s_eduStatus" /></td>
				</tr>
				<tr>
					<td><label>个人状态：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_perStatus" name="s_perStatus" /></td>
				</tr>
				<tr>
					<td><label>来源渠道：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_comeWay" name="s_comeWay" /></td>
				</tr>
				<tr>
					<td><label>来源网站：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_comeSite" name="s_comeSite" /></td>
				</tr>
				<tr>
					<td><label>来源关键词：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_sourceKeyWord" name="s_sourceKeyWord" /></td>
				</tr>
				<tr>
					<td><label>地址：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_address" name="s_address" /></td>
				</tr><tr>
					<td><label>咨询师：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_askerId" name="s_askerId" /></td>
				</tr>
				<tr>
					<td><label>QQ：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_QQ" name="s_QQ" /></td>
				</tr>
				<tr>
					<td><label>微信：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_weiXin" name="s_weiXin" /></td>
				</tr>
				<tr>
					<td><label>在线备注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_remarks" name="s_remarks" /></td>
				</tr>
				<tr>
					<td><label>创建时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_createTime" name="s_createTime" /></td>
				</tr>
				<tr>
					<td><label>课程方向：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_learnForward" name="s_learnForward" /></td>
				</tr>
				<tr>
					<td><label>是否有效：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isValid" /></td>
				</tr>
				<tr>
					<td><label>打分：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_record" name="s_record" /></td>
				</tr>
				<tr>
					<td><label>是否回访：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isReturnVisit" /></td>
				</tr>
				<tr>
					<td><label>首次回访时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_firstVisitTime" name="s_firstVisitTime" /></td>
				</tr>
				<tr>
					<td><label>是否上门：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isHome" /></td>
				</tr>
				<tr>
					<td><label>上门时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_homeTime" name="s_homeTime" /></td>
				</tr>
				<tr>
					<td><label>无效原因：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_lostReason" name="s_lostReason" /></td>
				</tr>
				<tr>
					<td><label>是否付费：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isPay" /></td>
				</tr>
				<tr>
					<td><label>付费时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_payTime" name="s_payTime" /></td>
				</tr>
				<tr>
					<td><label>金额：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_payMoney" name="s_payMoney" /></td>
				</tr>
				<tr>
					<td><label>是否退费：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isReturnMoney" /></td>
				</tr>
				<tr>
					<td><label>是否进班：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isInClass" /></td>
				</tr>
				<tr>
					<td><label>进班时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_inClassTime" name="s_inClassTime" /></td>
				</tr>
				<tr>
					<td><label>进班备注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_inClassRemarks" name="s_inClassRemarks" /></td>
				</tr>
				<tr>
					<td><label>咨询师备注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_askerRemarks" name="s_askerRemarks" /></td>
				</tr>
				<tr>
					<td><label>来源部门：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_fromPart" name="s_fromPart" /></td>
				</tr>
				<tr>
					<td><label>学员关注：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_focus" name="s_focus" /></td>
				</tr>
				<tr>
					<td><label>是否报备：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_isReport" /></td>
				</tr>
				<tr>
					<td><label>录入人：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_importEmployee" name="s_importEmployee" /></td>
				</tr>
				<tr>
					<td><label>退费原因：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_returnMoneyReason" name="s_returnMoneyReason" /></td>
				</tr>
				<tr>
					<td><label>定金：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_preMoney" name="s_preMoney" /></td>
				</tr>
				<tr>
					<td><label>定金时间：</label></td>
					<td><input class="easyui-textbox" type="text" id="s_preMoneyTime" name="s_preMoneyTime" /></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="detailClose()" style="width:100px">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>