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
    	init();
    })
    
    function init(){
        $("#empTab").datagrid({
            url:'../init',
            method:'post',
            pagination:true,
            singleSelect:true,
            toolbar:"#tb",
            queryParams:{
            	e_name:$("#e_name").val(),
            	ec_checkStatus:$("#ec_checkStatus").val(),
                startCheckInTime:$("#startCheckInTime").val(),
                endCheckInTime:$("#endCheckInTime").val()
            }
        
        });
        $('#tabfrm').form('clear');
    }
    
    function formatterimg(value,row,index){
        if(row.e_name != null && row.employee.e_photo != null && row.employee.e_photo != ''){
            return "<img style='width:40px;height:50px;' src='../image/"+row.employee.e_photo+"'>"
        }
    }
    
    function formatterSex (value,row,index) {
        if (row.employee.e_sex == "0") {
            return "女";
        } else if (row.employee.e_sex == "1") {
            return "男";
        }
    }
    
    function checkStatus (value,row,index) {
    	// 查询所有签到记录的判断
    	if (row.ec_ext5 == 1) {
    		if (row.ec_checkStatus == 1) {
    			return "已签到";
    		} else if (row.ec_checkStatus == 2) {
    			return "已签退";
    		}
    	} else if (row.ec_ext5 == 2) {
    		return "未签到";
    	} else if (row.ec_ext5 == 3) {
    		return "已签到";
    	} else if (row.ec_ext5 == 4) {
    		return "已签退";
    	}
    }
    
    function formatterEmail (value,row,index) {
    	return row.employee.e_protectEmail;
    }
    
    function formatterMTel (value,row,index) {
        return row.employee.e_protectMTel;
    }
    
    function formatterAge (value,row,index) {
    	var age = row.employee.e_age;
    	if (age != null) {
    		return age;
    	}
    }
    
    function formatterName (value,row,index) {
    	return row.employee.e_loginName;
    }
    
    function doSomething (value,row,index) {
    	return "<a href='javascript:void(0);' onclick='checkOut("+index+")'>签退</a>";
    }
    
    function checkOut (index) {
    	var data = $("#empTab").datagrid("getData");
    	var e_name = data.rows[index].e_name;
    	$.messager.confirm("确认对话框","您确定要签退‘"+e_name+"’吗？", function(r){
    	    if (r){
    	    	$.post("../signOut",{
    	    		e_loginName:e_name
    	    	},function(res){
    	    		if (res == "1") {
                        $.messager.alert("提示",""+e_name+"今天尚未签到！","error");
                    } else if (res == "2") {
                        $.messager.alert("提示",""+e_name+"今天已经签退过了！","error");
                    } else if (res == "4") {
                        $.messager.alert("提示","签退成功！","info");
                        $("#empTab").datagrid("reload");
                    } else if (res == "3") {
                        $.messager.alert("提示","签退失败！","error");
                    } else if (res == "5") {
                        $.messager.alert("提示","签退失败！","error");
                    }
    	    	},"json")
    	    }
    	});
    }
    
</script>
</head>
<body>
    <table id="empTab" class="easyui-datagrid">
        <thead>
            <tr>
                <th data-options="field:'e_name',title:'姓名'"></th>
                <th data-options="field:'e_sex',title:'性别 ',formatter:formatterSex"></th>
                <th data-options="field:'e_protectEmail',title:'密保邮箱 ',formatter:formatterEmail"></th>
                <th data-options="field:'e_protectMTel',title:'密保手机',formatter:formatterMTel"></th>
                <th data-options="field:'e_age',title:'年龄',formatter:formatterAge"></th>
                <th data-options="field:'e_photo',title:'照片' ,formatter:formatterimg"></th>
                <th data-options="field:'ec_checkStatus',title:'签到状态' ,formatter:checkStatus"></th>
                <th data-options="field:'ec_checkInTime',title:'最新签到时间' "></th>
                <th data-options="field:'ec_checkOutTime',title:'最新签退时间' "></th>
                <th data-options="field:'doSomething',title:'操作' ,formatter:doSomething"></th>
            </tr>
        </thead>
    </table>
    <div id="tb">
        <form  id="tabfrm" class="easyui-form">
            <label for="name">用户名：</label>   
            <input class="easyui-textbox" type="text" id="e_name"/>   
            <label for="name">签到状态：</label>
            <select class="easyui-combobox" id="ec_checkStatus" style="width:100px;">   
                <option value="">--请选择--</option>   
                <option value="3">未签到</option>   
                <option value="1">已签到</option>   
                <option value="2">已签退</option>   
            </select>
            <label for="name">签到时间：</label>   
            <input class="easyui-datebox" type="text"  id="startCheckInTime"/>~
            <input class="easyui-datebox" type="text"  id="endCheckInTime"/>    
            <a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
        </form>
    </div>
</body>
</html>