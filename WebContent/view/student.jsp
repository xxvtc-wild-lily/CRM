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
			
		});
		
	}
	function formattercaozuo(value,row,index){
		
		return "<a href='javascript:void(0)' onclick='updateStudent("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='deleteStudent("+index+")'>删除</a>"
	}
	
	function a_name(value,row,index){
		return row.asker.a_name;
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
				<th data-options="field:'a_name',title:'咨询师'  ,formatter:a_name"></th>
				<th data-options="field:'s_sex',title:'性别'  "></th>
				<th data-options="field:'s_phone',title:'电话'  "></th>
				<th data-options="field:'s_eduStatus',title:'学历状态'  "></th>
				<th data-options="field:'s_perStatus',title:'个人状态'  "></th>
				<th data-options="field:'s_comeWay',title:'来源渠道'  "></th>
				<th data-options="field:'s_comeSite',title:'来源网站'  "></th>
				<th data-options="field:'s_sourceKeyWord',title:'来源关键词'  "></th>
				<th data-options="field:'s_address',title:'地址'  "></th>
				<th data-options="field:'s_QQ',title:'QQ' "></th>
				<th data-options="field:'s_weiXin',title:'微信'  "></th>
				<th data-options="field:'s_remarks',title:'在线备注'  "></th>
				<th data-options="field:'s_createTime',title:'创建时间'  "></th>
				<th data-options="field:'s_learnForward',title:'课程方向'  "></th>
				<th data-options="field:'s_isValid',title:'是否有效'  "></th>
				<th data-options="field:'s_record',title:'打分'  "></th>
				<th data-options="field:'s_isReturnVisit',title:'是否回访'  "></th>
				<th data-options="field:'s_firstVisitTime',title:'首次回访时间'  "></th>
				<th data-options="field:'s_isHome',title:'是否上门'  "></th>
				<th data-options="field:'s_homeTime',title:'上门时间'  "></th>
				<th data-options="field:'s_lostReason',title:'无效原因'  "></th>
				<th data-options="field:'s_isPay',title:'是否付费'  "></th>
				<th data-options="field:'s_payTime',title:'付费时间'  "></th>
				<th data-options="field:'s_payMoney',title:'金额'  "></th>
				<th data-options="field:'s_isReturnMoney',title:'是否退费'  "></th>
				<th data-options="field:'s_isInClass',title:'是否进班'  "></th>
				<th data-options="field:'s_inClassTime',title:'进班时间'  "></th>
				<th data-options="field:'s_inClassRemarks',title:'进班备注'  "></th>
				<th data-options="field:'s_askerRemarks',title:'咨询师备注'  "></th>
				<th data-options="field:'s_fromPart',title:'来源部门'  "></th>
				<th data-options="field:'s_focus',title:'学员关注'  "></th>
				<th data-options="field:'s_isReport',title:'是否报备'  "></th>
				<th data-options="field:'s_importEmployee',title:'录入人'  "></th>
				<th data-options="field:'s_returnMoneyReason',title:'退费原因'  "></th>
				<th data-options="field:'s_preMoney',title:'定金'  "></th>
				<th data-options="field:'s_preMoneyTime',title:'定金时间'  "></th>
				<th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
			</tr>
		</thead>
	</table>
	<!-- <div id="studentTb">
		<form  id="tabfrm" class="easyui-form">
	        <label for="name">姓名:</label>   
	        <input class="easyui-validatebox" type="text"  id="s_name"/>   
	        
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
			<a href="javascript:void(0)" onclick="addEmployee()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">创建</a>
		</form>
	</div> -->
</body>
</html>