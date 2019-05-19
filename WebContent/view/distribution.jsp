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
    	initTable();
    	initSwitchButton();
    })
    
    function initTable() {
    	$("#dg").datagrid({
    		url:"../initDistributionTable",
    		method:"post",
    		pagination:true,
    		columns:[[
    			{field:"s_id",title:"学生ID",width:100},
    			{field:"s_name",title:"学生姓名",width:100},
    			{field:"s_age",title:"学生年龄",width:100},
    			{field:"s_sex",title:"学生性别",width:100},
    			{field:"s_phone",title:"学生手机",width:100},
    			{field:"s_eduStatus",title:"学历状态",width:100},
    			{field:"s_perStatus",title:"个人状态",width:100},
    			{field:"s_address",title:"住址",width:100},
    			{field:"s_QQ",title:"学生QQ",width:100},
    			{field:"s_weiXin",title:"学生微信",width:100},
    			{field:"s_record",title:"学生打分",width:100},
    			{field:"s_importEmployee",title:"录入人",width:100}
    		]],
    		toolbar:"#tb"
    	})
    }
    
    function initSwitchButton() {
    	$("#distributionButton").switchbutton({
    		checked:true,
    		width:100,
    		onText:"自动分量",
    		offText:"手动分量",
    		onChange:function(checked) {
    			$.messager.confirm("提示","您确定要切换分量状态吗？", function(r){
    			    if (r) {
    			    	if (checked) {
    			    		alert(1);
    			    	} else {
    			    		alert(2);
    			    	}
    			    }
    			});
    		}
    	})
    }
    
</script>
</head>
<body>
    <table id="dg"></table>
    <div id="tb">
        <input id="distributionButton" style="width:200px;height:30px">
	</div>
</body>
</html>