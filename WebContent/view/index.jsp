<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("path",request.getContextPath());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    	$("#tree").tree({    
    	    url:"../initTree",
    	    method:"post",
    	    animate:true,
    	    lines:true,
    	    queryParams:{
    	    	e_loginName:"${employee.e_loginName}",
    	    	e_passWord:"${employee.e_passWord}"
    	    },
    	    onClick:function(node) {
    	    	var title = node.text;
    	    	var url = node.attribute;
    	    	var flag = $("#indexTab").tabs("exists", title);
    	    	var isLeaf = $("#tree").tree("isLeaf", node.target); //是否是叶子节点
                if(isLeaf) { //只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能）
                    if(!flag) {
                        $("#indexTab").tabs("add", { //在选项卡中，创建1个选项页
                            title: title, //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
                            closable: true,
                            fit:true,
                            content: "<iframe style='width:1200px;height:600px;' src='" + ${path }/+url + "'/>" //此处做了调整，推荐使用iframe的方式实现
                            });
                    } else {
                        $("#indexTab").tabs("select", title); //直接选中title对应的选项卡
                    }
                }
    	    }
    	});
    })
    
    // 安全退出的方法
    function safeSignOut() {
    	$.messager.confirm("确认对话框","您想要退出该系统吗？",function(r){
    	    if (r){
    	    	$.ajax({
    	    		url: "../safeSignOut",
    	    		async:false,
    	    		method:"post",
    	    		success:function(res) {
    	    			if (res == "1") {
    	    				window.location.reload();
    	    			} else {
    	    				$.messager.alert("提示","退出失败！","error");
    	    			}
    	    			
    	    		}
    	    	});
    	    }
    	});
    }
    
    function register() {
    	var e_loginName = ${employee.e_loginName}
    	
    	$.post("../register",{
    		e_loginName:e_loginName
    	},function(res){
    		if (res == "1") {
    			$.messager.alert("提示","您今天已经签到过了！","error");
    		} else if (res == "2") {
    			$.messager.alert("提示","当前不在签到时间内！","error");
    		} else if (res == "3") {
    			$.messager.alert("提示","签到成功！","info");
    		} else if (res == "4") {
    			$.messager.alert("提示","签到失败！","info");
    		}
    	},"json")
    }
    
    function signBack() {
    	var e_loginName = ${employee.e_loginName}
    	
    	$.messager.confirm("确认对话框","您确认要签退吗？", function(r){
    	    if (r){
    	    	$.post("../signBack",{
    	            e_loginName:e_loginName
    	        },function(res){
    	            if (res == "1") {
    	                $.messager.alert("提示","您今天目前尚未签到！","error");
    	            } else if (res == "2") {
    	                $.messager.alert("提示","您今天已经签退过了！","error");
    	            } else if (res == "3") {
    	                $.messager.alert("提示","当前不在签退时间内！","error");
    	            } else if (res == "4") {
    	                $.messager.alert("提示","签退成功！","info");
    	            } else if (res == "5") {
    	                $.messager.alert("提示","签退失败！","error");
    	            }
    	        },"json")
    	    }
    	});
    }
    
</script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:120px;padding:10px">
        <div style="font-size:20px;">
                欢迎使用CRM管理系统<br/>
                用户名：${employee.e_loginName }<br/>
         <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="register()">签到</a>
         <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="signBack()">签退</a>
         <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="safeSignOut()">安全退出</a>
        </div>
    </div>
    <div data-options="region:'west',split:true,title:'West'" style="width:170px;padding:0px;">
        <ul id="tree"></ul>
    </div>
    <div data-options="region:'south',border:false" style="height:50px;padding:10px;">south region</div>
    <div data-options="region:'center',title:'Center'">
        <div id="indexTab" class="easyui-tabs" style="width:auto;height:auto;">
            
        </div>
    </div>
<body>

</body>
</html>