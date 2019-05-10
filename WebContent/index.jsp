<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="js/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" href="js/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:60px;padding:10px">
        north
    </div>
    <div data-options="region:'west',split:true,title:'West'" style="width:150px;padding:0px;">
        west
    </div>
    <div data-options="region:'south',border:false" style="height:50px;padding:10px;">south region</div>
    <div data-options="region:'center',title:'Center'"></div>
</body>
</html>