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
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" href="${path }/js/jquery-easyui-1.7.0/themes/icon.css">
<link type="text/css" rel="stylesheet" href="${path }/css/main.css">
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path }/js/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script src="${path }/js/echarts/echarts-all.js"></script>
<script src="${path }/js/home.js"></script>
<script type="text/javascript">
    
    $(function(){
    	chushihua()
    })
    function chushihua(){
    	$("#tree").tree({    
    	    url:"initTree",
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
                            content: "<iframe style='width:1360px;height:577px;' src='" + ${path }/+url + "'/>" //此处做了调整，推荐使用iframe的方式实现
                            });
                    } else {
                        $("#indexTab").tabs("select", title); //直接选中title对应的选项卡
                    }
                }
    	    }
    

    	
    })
    

    }

    // 安全退出的方法
    function safeSignOut() {
    	$.messager.confirm("确认对话框","您想要退出该系统吗？",function(r){
    	    if (r){
    	    	$.ajax({
    	    		url:"safeSignOut",
    	    		async:false,
    	    		method:"post",
    	    		data:{
    	    			e_loginName:"${employee.e_loginName}"
    	    		},
    	    		success:function(res) {
    	    			if (res == "1") {
    	    				window.location.href="toSignin";
    	    			} else {
    	    				$.messager.alert("提示","退出失败！","error");
    	    			}
    	    			
    	    		}
    	    	});
    	    }
    	});
    }
    
    function register() {
    	var e_loginName = '${employee.e_loginName}'
    	
    	$.post("register",{
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
    	var e_loginName = '${employee.e_loginName}'
    	
    	$.messager.confirm("确认对话框","您确认要签退吗？", function(r){
    	    if (r){
    	    	$.post("signBack",{
    	            e_loginName:e_loginName
    	        },function(res){
    	            if (res == "1") {
    	                $.messager.alert("提示","您今天尚未签到！","error");
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
  
    
    
    
    
    
   
		//数据统计图
		$("#rightTab").tabs({
		       height:250,
		        border:false
		})
    	$(function(){
        var myChart = echarts.init($("#chart01")[0]);
//app.title = '堆叠柱状图';
		$.post("selectSuoDingZhaungTaiCounts",{
			e_loginName:"${employee.e_loginName}"
		},function(res){
			if(res[2]=='管理员'){
				var data1=['锁定人数','未锁定人数'];
				var data2=[
                    {value:res[0], name:'锁定人数'},
                    {value:res[1], name:'未锁定人数'}
                    ];
			}else if(res[2]=='咨询经理'){
				var data1=['签到人数','未签到人数'];
				var data2=[
                    {value:res[0], name:'签到人数'},
                    {value:res[1], name:'未签到人数'}
                    ];
			}else if(res[2]=='咨询师' || res[2]=='网络咨询师'){
				var data1=['流失数量','录入数量','正在跟进'];
				var data2=[
                    {value:res[0], name:'流失数量'},
                    {value:res[1], name:'录入数量'},
                    {value:res[3], name:'正在跟进'}
                    ];
			}else {
				data1=["未分配角色"];
				var data2=[
                    {value:0, name:'未分配角色'}
                    ];
			}
			option = {
	                tooltip : {
	                        trigger: 'item',
	                        formatter: "{a} <br/>{b} : {c} ({d}%)"
	                },
	                legend: {

	                        left: 'left',
	                        data: data1
	                },
	                series : [
	                        {
	                                name: '数据',
	                                type: 'pie',
	                                radius : '55%',
	                                center: ['50%', '60%'],
	                                data:data2,
	                                itemStyle: {
	                                        emphasis: {
	                                                shadowBlur: 10,
	                                                shadowOffsetX: 0,
	                                                shadowColor: 'rgba(0, 0, 0, 0.5)'
	                                        }
	                                }
	                        }
	                ]
	               
	        };
			 myChart.setOption(option);
		},"json");
		 
        
        
});
    
    	
	    var websocket = null;
	    //判断当前浏览器是否支持WebSocket
	    if ('WebSocket' in window) {
	        //建立连接，这里的/websocket ，是Servlet中注解中的那个值
	        websocket = new WebSocket("ws://localhost:8080/CRM/websocket");
	    }
	    else {
	        alert('当前浏览器 Not support websocket');
	    }
	    //连接发生错误的回调方法
	    websocket.onerror = function () {
	        console.log("WebSocket连接发生错误");
	    };
	    //连接成功建立的回调方法
	    websocket.onopen = function () {
	        console.log("WebSocket连接成功");
	    }
	    //接收到消息的回调方法
	    websocket.onmessage = function (event) {
	        console.log(event.data);
	        if(event.data=="1"){
	            console.log("数据更新啦");
	            chushihua();
	        }
	    }
	    //连接关闭的回调方法
	    websocket.onclose = function () {
	    	// 从application清空当前用户信息
	    	$.post("errorClose",{
	    		e_loginName:"${employee.e_loginName}"
	    	})
	        console.log("WebSocket连接关闭");
	    }
	    //监听窗口关闭事件，当窗口关闭时，主动去关闭WebSocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	    window.onbeforeunload = function () {
	    	// 从application清空当前用户信息
	    	$.post("errorClose",{
                e_loginName:"${employee.e_loginName}"
            })
	        closeWebSocket();
	    }
	    //关闭WebSocket连接
	    function closeWebSocket() {
	    	// 从application清空当前用户信息
	    	$.post("errorClose",{
                e_loginName:"${employee.e_loginName}"
            })
	        websocket.close();
	    }  
    
    
    
    
    
    
    function openUpdatePasswordDialog() {
    	$("#updatePasswordDialog").dialog("open");
    }
    
    
    var code=null;
    
    //获取验证码的方法
    function accountCode() {
    	// 声明搭载手机号的对象
        var phoneNumber = "";
        
        // 获取验证码的方法
        $.post("getPhoneNumber",{
        	e_loginName:"${employee.e_loginName}"
        },function(res){
        	// 将后台传过来的值赋给phoneNumber
        	phoneNumber = res;
        	// 如果手机号不为空进入下一步，否则提示手机号获取失败
        	if (phoneNumber != null && phoneNumber != "") {
                var reg =/^[1][3,4,5,7,8][0-9]{9}$/;
                if (reg.test(phoneNumber)) {
                    $.post("getRandomCode",{
                        phoneNumber:phoneNumber
                    },function(res){
                        code = res;
                    })
                } else {
                    $.messager.alert("提示","手机号格式错误，请联系管理员解决！","error");
                }
            } else {
                $.messager.alert("提示","手机号获取失败，请联系管理员解决！","error");
            }
        	
        },"json")
        
    }
    
    // easyui验证是否相同
    $.extend($.fn.validatebox.defaults.rules, {
        equals: {
            validator: function(value,param){
                return value == $(param[0]).val();
            },
            message:"两次输入密码不一致！"
        }
    });
    
    // 判断密码必须为字母和数字的正则表达式
    var regPassword = /^(?=.*?[a-z)(?=.*>[A-Z])(?=.*?[0-9])[a-zA_Z0-9]{6,10}$/;
    
    function ok() {
    	var oldPassword = $("#oldPassword").val();
    	var newPassword = $("#newPassword").val();
    	var replayPassword = $("#replayPassword").val();
    	var randomCode = $("#randomCode").val();
    	
    	// 判断输入的原密码是否为6位或以上
        if (oldPassword.length >= 6) {
        	// 判断原密码是否同时包含字母和数字
            if (regPassword.test(oldPassword)) {
            	// 判断输入的新密码是否为6位或以上
                if (newPassword.length >= 6) {
                	// 判断新密码是否同时包含字母和数字
                    if (regPassword.test(newPassword)) {
	                    // 判断两次输入的密码是否一致
	                    if (newPassword == replayPassword) {
	                        // 判断验证码是否一致
	                        if (randomCode == code) {
	                        	// 判断新密码是否与原密码一致
	                        	if (newPassword != oldPassword) {
	                        		// 判断原密码是否正确
	                                $.post("checkOldPassword",{
	                                    e_loginName:"${employee.e_loginName}",
	                                    e_passWord:oldPassword
	                                },function(res){
	                                    // 如果大于0则说明原密码正确
	                                    if (res > 0) {
	                                    	// 修改密码
	                                         $.post("updatePassword",{
	                                             e_loginName:"${employee.e_loginName}",
	                                             e_passWord:newPassword
	                                         },function(res){
	                                             if (res > 0) {
	                                                 $.messager.alert("提示","修改成功，3秒后自动跳转至登录页面！","info");
	                                                 $.post("returnIndex");
	                                                 setTimeout("window.location.reload()",3000);
	                                             } else {
	                                                 $.messager.alert("提示","修改失败！","error");
	                                             }
	                                         },"json")
	                                    } else {
	                                        $.messager.alert("提示","原密码不匹配！","error");
	                                    }
	                                },"")
	                        	} else {
	                        		$.messager.alert("提示","新密码不能与原密码一致！","error");
	                        	}
	                        } else {
	                            $.messager.alert("提示","验证码错误！","error");
	                        }
	                    } else {
	                        $.messager.alert("提示","两次输入的密码不一致！","error");
	                    }
                    } else{
                    	$.messager.alert("提示","新密码格式错误！","error");
                    }
                } else {
                    $.messager.alert("提示","新密码未在6位以上！","error");
                }
            } else {
            	$.messager.alert("提示","原密码格式错误！","error");
            }
        } else {
        	$.messager.alert("提示","原密码未在6位以上！","error");
        }
    	
    }
    
</script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:50px;padding:10px">
        <div style="font-size:20px;">
                欢迎${employee.e_loginName }使用CRM管理系统
         <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="register()">签到</a>
         <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-filter'" onclick="signBack()">签退</a>
         <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="openUpdatePasswordDialog()">修改密码</a>
         <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="safeSignOut()">安全退出</a>
        </div>
    </div>
    <div data-options="region:'west',split:true,title:'West'" style="width:170px;padding:0px;">
        <ul id="tree"></ul>
    </div>
    <div data-options="region:'center',title:'Center'" style="width:1300px">
        <div id="indexTab" class="easyui-tabs" style="width:1364px;height:617px;">
            <div class="allBox"  data-options="title:'首页'">
				    <div class="homeLeft04">
				        <h5 class="hStyle"><span>数据分析</span></h5>
				        <p class="stataAny" id="chart01"></p>
				    </div>
				    <div class="homeLeft04">
				        <h5 class="hStyle"><span>交货分析</span></h5>
				        <p class="stataAny" id="chart02"></p>
				    </div>
				    <div class="homeLeft05">
				        <h5 class="hStyle"><span>交货分析</span></h5>
				        <p class="stataAny" style="height: 220px" id="chart03"></p>
				    </div>
			</div>
        </div>
    </div>
    <div id="updatePasswordDialog" class="easyui-dialog" title="修改密码" style="width:400px;height:220px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
        <form id="updatePasswordForm">
            <table id="updatePasswordTable" style="margin:auto auto">
                <tr>
                    <td>请输入原密码：</td>
                    <td><input class="easyui-passwordbox" id="oldPassword" style="width:200px"></td>
                </tr>
                <tr>
                    <td>请输入新密码：</td>
                    <td><input class="easyui-passwordbox" id="newPassword" style="width:200px"></td>
                </tr>
                <tr>
                    <td>请重复新密码：</td>
                    <td><input class="easyui-passwordbox" id="replayPassword" style="width:200px" validType="equals['#newPassword']"></td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" onclick="accountCode()">获取验证码</a></td>
                    <td><input class="easyui-textbox" id="randomCode" style="width:200px"></td>
                </tr>
            </table>
        </form>
        <div id="oldPasswordTips" style="margin-left:160px;"></div>
        <a class="easyui-linkbutton" style="margin-left:190px;margin-top:5px;" onclick="ok()">确定</a>
    </div>
</body>
</html>