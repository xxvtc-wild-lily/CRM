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
    
</script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:120px;padding:10px">
        <div style="font-size:20px;">
                欢迎使用CRM管理系统<br/>
                用户名：${employee.e_loginName }<br/>
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