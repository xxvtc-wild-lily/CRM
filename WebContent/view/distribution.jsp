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
    // 判断是否开启的判断
    var flag;
    $(function(){
        $.post("../selectIsOpenAuto",{
            
        },function(res){
            if (res == 1) {
                flag = true;
            } else {
                flag = false;
            }
            initTable();
            initSwitchButton();
        })
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
    		checked:flag,
    		width:120,
    		onText:"自动分量开启",
    		offText:"自动分量关闭",
    		onChange:function(checked) {
    			if (checked) {
    				$.post("../distributionStudent",{e_loginName:${employee.e_loginName}},function(res){},"json");
    			} else {
    				$.post("../closedDistributionStudent",{e_loginName:${employee.e_loginName}},function(res){},"json");
    			}
    		}
        })
    }
    
    function openHandDistributionDialog() {
    	// 加载所有咨询师的datalist
        $("#allAsker").datalist({ 
            url:"../getAllAsker",
            singleSelect:true,
            textFormatter:function (value,row,index) {
                return row.a_name;
            }
        });
    	
    	// 加载所有未分配学生的datalist
        $("#allNotDistributionStudent").datalist({ 
            url:"../allNotDistributionStudent",
            singleSelect:false,
            textFormatter:function (value,row,index) {
                return row.s_name;f
            }
        });
        $("#handDistributionDialog").dialog("open");
    }
    
    function distributionStudent() {
    	// 获取选中的咨询师数据
    	var askerData = $("#allAsker").datalist("getSelections");
    	// 获取选中的学生数据
    	var studentData = $("#allNotDistributionStudent").datalist("getSelections");
    	// 判断是否选择咨询师
    	if (askerData != null && askerData != "") {
    		// 判断是否选择学生
    		if (studentData != null && studentData != "") {
    			// 获取选中的咨询师id
    	        var askerId = askerData[0].a_id;
    			// 声明存放学生id的数组
    	        var studentIdArr = [];
    			// 循环将学生id放入数组
    	        for (var i = 0;i < studentData.length;i++) {
    	        	studentIdArr += studentData[i].s_id+","
    	        }
    	        $.post("../handDistributionStudent",{
    	        	s_askerId:askerId,
    	        	studentIdArr:studentIdArr
    	        },function(res){
    	        	if (res > 0) {
    	        		$.messager.alert("提示","分配成功！","info");
    	        		$("#dg").datagrid("reload");
    	        	} else {
    	        		$.messager.alert("提示","分配失败！","error");
    	        	}
    	        },"json")
    		} else {
    			$.messager.alert("提示","请选择至少一个学生！","error");
    		}
    	} else {
    		$.messager.alert("提示","请选择咨询师！","error");
    	}
    	
    }
    
</script>
</head>
<body>
    <table id="dg"></table>
    <div id="tb">
        <input id="distributionButton" style="width:200px;height:30px">
        <a href="javascript:void(0);" id="handDistribution"  class="easyui-linkbutton" data-options="iconCls:'icon-sum'" onclick="openHandDistributionDialog()">手动分配</a>
	</div>
	<div class="easyui-dialog" id="handDistributionDialog" title="手动分配学生" style="width:500px;height:2  90px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
	   <table>
            <tr>
                <td>请选择要分配的咨询师（单选）</td>
                <td></td>
                <td>请选择要为咨询师分配的学生（多选）</td>
            </tr>
            <tr>
                <td><div id="allAsker" style="height:200px;width:200px;"></div></td>
                <td>
                    <button id="dl_add" class="easyui-linkbutton" style="width:50px;margin:5px;" onclick="distributionStudent()">确定</button><br />
                </td>
                <td><div id="allNotDistributionStudent" style="height:200px;width:200px;"></div></td>
            </tr>
       </table>
    </div>
</body>
</html>