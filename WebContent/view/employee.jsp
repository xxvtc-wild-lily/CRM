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
		$("#signUpDialog").dialog({
            title:"创建新员工",
            width:600,
            height:560,
            modal:true,
            closed:true
        })
       
	})
	
	function init(){
		$("#empTab").datagrid({
			url:"../selectEmployee",
			method:"post",
			pagination:true,
			singleSelect:true,
			toolbar:"#tb",
			queryParams:{
				e_loginName:$("#e_loginName").val(),
				in_e_createTime:$("#in_e_createTime").val(),
				en_e_createTime:$("#en_e_createTime").val(),
				e_isLockOut:$("#e_isLockOut").val()
			},
			columns:[[    
		        {field:"e_id",title:"编号",width:30},
		        {field:"e_loginName",title:"登录名",width:100},
		        {field:"e_isLockOut",title:"是否锁定",width:70,formatter:formatterIsLock},
		        {field:"e_lastLoginTime",title:"最后一次登录时间",width:170},
		        {field:"e_createTime",hidden:true,title:"创建时间",width:170},
		        {field:"e_protectEmail",title:"密保邮箱",width:170},
		        {field:"e_protectMTel",title:"密保手机号",width:100},
		        {field:"e_sex",title:"员工性别",width:65,formatter:formatterSex},
		        {field:"e_age",title:"员工年龄",width:65},
		        {field:"e_photo",title:"员工照片",width:70,formatter:formatterImg},
		        {field:"e_inCompanyTime",title:"入职时间",width:180},
		        {field:"caozuo",title:"操作",width:350,formatter:formattercaozuo}
		    ]]
		});
		$('#tabfrm').form('clear');
	}
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' class='easyui-linkbutton' data-options='iconCls:'icon-search'' onclick='detail("
				+index+")'>查看</a><a href='javascript:void(0)' onclick='updateEmployee("
				+index+")'>修改</a><a href='javascript:void(0)' onclick='deleteEmployee("
				+index+")'>删除</a><a href='javascript:void(0)' onclick='openUpdateRoleDialog("
				+index+")'>修改角色</a><a href='javascript:void(0)' onclick='openResertPasswordDialog("
				+index+")'>重置密码</a> <a href='javascript:void(0)' onclick='lockEmployee("
				+index+")'>锁定用户</a> <a href='javascript:void(0)' onclick='unlockEmployee("
				+index+")'>解锁用户</a>"
				
	}
	//初始化头像
	function formatterImg(value,row,index){
		if(value != null && value != ''){
			return "<img style='width:40px;height:50px;' src='../image/"+value+"'>"
		}
	}
	//初始化锁定状态
	function formatterIsLock(value,row,index) {
		var e_isLockOut = row.e_isLockOut;
		var status = "";
		if (e_isLockOut == null) {
			status = "未锁定"
		} else if (e_isLockOut == 0) {
			status = "未锁定"
		} else {
			status = "已锁定"
		}
		return status;
	}
	//初始化性别
	function formatterSex (value,row,index) {
		var sex = "";
		if (row.e_sex == "0") {
			sex = "女";
		} else if (row.e_sex == "1") {
			sex = "男";
		} else {
			sex = "未填";
		}
		
		return sex;
	}
	
	function updateEmployee(index){
		var data=$("#empTab").datagrid("getData");
		var row=data.rows[index];
		$('#updateForm').form('load',row);
		$("#updateDialog").dialog("open");
	}
	//修改员工信息
	function saveUpdat(){
		
		// 判断手机号的正则表达式
        var regMTel=/^[1][3,4,5,7,8][0-9]{9}$/;
        // 判断邮箱的正则表达式
        var regEmail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        
        var e_protectMTel = $("#updatee_protectMTel").val();
        var e_protectEmail = $("#updatee_protectEmail").val();
        
        // 判断手机号是否正确
        if (regMTel.test(e_protectMTel)) {
            // 判断邮箱是否正确
            if (regEmail.test(e_protectEmail)) {
            	
            	$.post("../updateEmployee",{
                    e_loginName:$("#updatee_loginName").val(),
                    e_protectEmail:e_protectEmail,
                    e_protectMTel:e_protectMTel
                },function(res){
                    if(res>0){
                        $.messager.alert("提示","修改成功！","info");
                        $("#updateDialog").dialog("close");
                        $("#empTab").datagrid("reload");
                    }else{
                        $.messager.alert("提示","修改失败！","error");
                        
                    }
                },"json")
            	
            } else {
            	$.messager.alert("提示","请输入正确的邮箱！","error");
            }
        } else {
            $.messager.alert("提示","请输入正确的手机号！","error");
        }
        
	}
	function closeUpdat(){
		$("#updateDialog").dialog("close");
	}
	//给员工赋予角色
	function openUpdateRoleDialog(index) {
		var data = $("#empTab").datagrid("getData");
		var row = data.rows[index];
		var e_loginName = row.e_loginName;
		var e_id = row.e_id;
		
		// 加载所有角色的datalist
		$("#allRoleDatalist").datalist({ 
		    url:"../getAllRole",
		    singleSelect:false,
		    textFormatter:function (value,row,index) {
		    	return row.r_name;
		    },
		    onClickRow:function (index,row) {
		    	if (row.text == null) {
		    		row.text = "checked";
		    		row.id = e_id;
		    	} else {
		    		row.text = null;
		    	}
		    	
		    }
		});
		// 加载员工已有角色的datalist
		$("#employeeRoleDatalist").datalist({ 
            url:"../getEmployeeRole",
            queryParams:{
                e_loginName:e_loginName
            },
            singleSelect:false,
            textFormatter:function (value,row,index) {
                return row.r_name;
            },
            onClickRow:function (index,row) {
            	if (row.text == null) {
                    row.text = "checked";
                    row.id = e_id;
                } else {
                    row.text = null;
                }
            }
        });
		
		$("#updateRoleDialog").dialog("open");
	}
	//查看员工信息
	function detail(index){
		var data=$("#empTab").datagrid("getData");
    	var row=data.rows[index];
    	$("#detailForm").form("load",row);
    	$("#detailDialog").dialog("open");
	}
	function detailClose(){
		$("#detailDialog").dialog("close");
	}
	
	// 给用户添加角色的方法
	function removeRoleToEmployee() {
		// 查询到选中的用户角色
        var roleData  = $('#allRoleDatalist').datalist("getSelections");
        // 查询用户已有的角色
        var employeeData = $("#employeeRoleDatalist").datalist("getData");
        var arr = "";
        
        // 判断必须选择角色
        if (JSON.stringify(roleData) != "[]") {
            // 判断用户的已有的角色不能为空
            if (employeeData.total != 0) {
                for (var i = 0;i < roleData.length;i++) {
                	var a = 0;
                    for (var j = 0;j < employeeData.total;j++) {
                        if (roleData[i].r_id != employeeData.rows[j].r_id) {
                        	a ++;
                        }
                    }
                    // 如果本次循环的角色id与用户拥有的都不一样，说明用户没有此id，遂添加进数组
                    if(a==employeeData.total){
                    	arr += roleData[i].r_id +","
                    }
                }
            } else {
                // 用户没有角色的判断
                
                // 循环拿到选中的角色id
                for (var i = 0;i < roleData.length;i++) {
                    arr += roleData[i].r_id +","
                }
            }
        } else {
            // 没有选择添加的角色的判断
            $.messager.alert("提示","请至少选择一项！","error");
        }
        
        // 如果数组里没有任何东西就说明全部拥有
        if (arr == "") {
        	$.messager.alert("提示","所选角色以拥有！","error");
        } else {
        	$.post("../removeRoleToEmployee",{
                arr:arr,
                e_id:roleData[0].id
            },function(res){
                if (res > 0) {
                    $.messager.alert("提示","添加成功！","info");
                    $("#employeeRoleDatalist").datalist("reload");
                    $("#allRoleDatalist").datagrid("clearSelections");
                    $("#employeeRoleDatalist").datagrid("clearSelections");
                }
            },"json")
        }
        
	}
	
	// 去除用户角色的方法
	function removeEmployeeToAll() {
		var empRole  = $('#employeeRoleDatalist').datalist("getSelections");
		var arr = "";
		var zixunshi="";
		if (JSON.stringify(empRole) != "[]") {
			for (var i = 0;i < empRole.length;i++) {
				arr += empRole[i].r_id +",";
				zixunshi+=empRole[i].r_name+",";
			}
		} else {
			// 没有选择添加的角色的判断
            $.messager.alert("提示","请至少选择一项！","error");
		}
		
		// 如果数组里没有任何东西就说明全部拥有
        if (arr != "") {
        	$.post("../removeEmployeeToAll",{
                arr:arr,
                r_name:zixunshi,
                e_id:empRole[0].id
            },function(res){
                if (res > 0) {
                    $.messager.alert("提示","移除角色成功！","info");
                    $("#employeeRoleDatalist").datalist("reload");
                    $("#allRoleDatalist").datagrid("clearSelections");
                    $("#employeeRoleDatalist").datagrid("clearSelections");
                }else{
                	 $.messager.alert("提示","该员工有正在跟进的学生咨询师角色移除失败！","info");
                	 $("#employeeRoleDatalist").datalist("reload");
                }
            },"json")
        }
	}
	
	
	
	function openAddDialog(){
		$("#signUpDialog").dialog("open");
	}
	
	
	// 清空所填Form表单的数据
    function clearSignUpForm(){
        $("#signUpForm").form("clear");
        var image = document.getElementById("previewImage");
        image.src = "";
        image.style = "";
    }
    
    // 关闭注册Dialog
    function closeSignUpDialog(){
        $("#signUpDialog").dialog("close");
    }
    
    // 选中图片后显示图片预览
    function fileChange(obj){
        // 获取拿到的图片路径
        var filePath = obj.value;
        // 图片允许的类型
        var fileTypes = [".jpg",".png"];
        // 获取预览框img元素
        var image = document.getElementById("previewImage");
        // 获取图片
        var filePic = obj.files[0];
        // 声明filereader对象，通过此对象实现实时预览
        var reader = new FileReader();
        // 设置图片大小的初始值
        var fileSize = 0;
        // 设置图片允许的大小
        var fileMaxSize = 2048;
        
        // 每次变动前将预览的img标签的样式，路径清空以免出现漏网之鱼（不符合规格的图片使用上一张符合规格的照片属性以避过判断）
        image.style = "";
        image.src = "";
        
        // 如果拿到的图片路径不为空
        if (filePath){
            // 设置图片类型是否允许进入的判断值
            var isNext = false;
            // 拿到图片的后缀格式
            var fileEnd = filePath.substring(filePath.indexOf("."));
            for (var i = 0; i < fileTypes.length; i++) {
                if (fileTypes[i] == fileEnd) {
                    isNext = true;
                    break;
                }
            }
            
            // 判断图片类型是否正确，如果正确，进入判断图片尺寸
            if (isNext){
                // 将图片写入src中
                reader.readAsDataURL(filePic);
                // 读取路径会触发这个onload事件
                reader.onload = function (e) {
                    // 再设置img图片预览
                    image.src = e.target.result;
                    // 之后会触发这个onload事件
                    image.onload=function(){
                        var width = image.width;
                        var height = image.height;
                        
                        // 判断图片尺寸，如果图片尺寸符合，之后判断图片大小是否符合
                        if (width <= 295 && height <= 413){
                            // 设置图片的宽高，以防宽高过长导致样式巨变
                            image.style = "width:140px;height:200px;";
                            // 将图片大小重设为选择的图片大小
                            fileSize =obj.files[0].size;
                            // 将图片大小除以1024得到我们想要的通俗大小（1024，2048等）
                            var size = fileSize / 1024;
                            
                            // 判断图片大小是否合适
                            if (size > fileMaxSize) {
                                $.messager.alert("提示","图片大小不能大于2M！","error");
                                file.value = "";
                                img.src = "";
                                return false;
                            } else if (size <= 0) {
                                $.messager.alert("提示","图片大小不能为0M！","error");
                                file.value = "";
                                img.src = "";
                                return false;
                            } else{
                                $.messager.alert("提示","图片格式正确","info");
                            }
                        } else {
                            $.messager.alert("提示","图片尺寸应为：一寸（295px*413px）！","error");
                            obj.value = "";
                            image.src = "";
                            return false;
                        }
                    };
                };
            } else{
                $.messager.alert("提示","不是符合规定的图片类型（只接受.jpg和.png类型）！","error");
                obj.value = "";
                return false;
            }
        } else {
            $.messager.alert("提示","没有获取到图片！","error");
            obj.value = "";
            return false;
        }
    }
    
    // 提交注册请求
    function signUp(){
        var e_loginName = $("#e_loginNameSignUp").val();
        var e_passWord = $("#e_passWordSignUp").val();
        var e_retypePassWord = $("#e_retypePassWordSignUp").val();
        var e_protectMTel = $("#e_protectMTelSignUp").val();
        var e_protectEmail = $("#e_protectEmailSignUp").val();
        
        
        // 判断手机号的正则表达式
        var regMTel=/^[1][3,4,5,7,8][0-9]{9}$/;
        // 判断邮箱的正则表达式
        var regEmail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        // 判断密码必须为字母和数字的正则表达式
        var regPassword = /^(?=.*?[a-z)(?=.*>[A-Z])(?=.*?[0-9])[a-zA_Z0-9]{6,10}$/;
        
        // 设置判断，姓名密码为必填
        if (e_loginName != "" && e_loginName != null && e_loginName != undefined 
            && e_passWord != "" && e_passWord != null && e_passWord != undefined 
            && e_retypePassWord != "" && e_retypePassWord != null && e_retypePassWord != undefined 
            && e_protectMTel != "" && e_protectMTel != null && e_protectMTel != undefined 
            && e_protectEmail != "" && e_protectEmail != null && e_protectEmail != undefined) {
            
            // 判断输入的密码是否为6位或以上
            if (e_passWord.length >= 6) {
            	// 判断密码是否同时包含字母和数字
            	if (regPassword.test(e_passWord)) {
	                // 判断两次输入的密码是否一致
	                if (e_passWord==e_retypePassWord) {
	                    // 判断手机号是否正确
	                    if (regMTel.test(e_protectMTel)) {
	                        // 判断邮箱是否正确
	                        if (regEmail.test(e_protectEmail)) {
	                            // 拿到选中的性别，如果没有则为undefined
	                            var e_sex = $('input[name="e_sexSignUp"]:checked').val();
	                            var e_age = $("#e_ageSignUp").val();
	                            
	                            if (e_age != null && e_age != "" && e_age != " " && e_age != undefined) {
	                                 // 判断年龄是否在18~100岁之间
	                                if (e_age >=18 && e_age<=100) {
	                                    e_age = $("#e_ageSignUp").val();
	                                } else {
	                                    $.messager.alert("提示","年龄应在18~100岁之间！","error");
	                                    return;
	                                }
	                            }
	                            
	                            // 获取拿到的file
	                            var e_photo = $("#e_photoSignUp").get(0).files[0];
	                            // 声明FormData对象用来传值
	                            var formData=new FormData();
	                            formData.append("e_loginName",e_loginName);
	                            formData.append("e_passWord",e_passWord);
	                            formData.append("e_protectMTel",e_protectMTel);
	                            formData.append("e_protectEmail",e_protectEmail);
	                            formData.append("e_sex",e_sex);
	                            formData.append("e_age",e_age);
	                            formData.append("e_photo",e_photo);
	                            
	                            // 判断用户是否选择图片
	                            if (e_photo != undefined) {
	                                // 选择图片的ajax
	                                $.ajax({
	                                    url:"../insertSignUpEmployeeHaveImage",
	                                    type:"post",
	                                    data:formData,
	                                    async:false,
	                                    contentType:false,
	                                    processData:false,
	                                    success:function(res){
	                                        if (res == 0) {
	                                            $.messager.alert("提示","注册成功！","info");
	                                        } else if (res == 1) {
	                                            $.messager.alert("提示","注册失败！（原因：图片名重复，请再试一次）","error");
	                                        } else if (res == 2) {
	                                            $.messager.alert("提示","注册失败！","error");
	                                        } else if (res == 3) {
	                                            $.messager.alert("提示","注册失败（原因：登录名已存在，请再输入一个不同的）！","error");
	                                        } else if (res == 4) {
	                                        	$.messager.alert("提示","注册失败（原因：手机号已存在，请再输入一个不同的）！","error");
	                                        } else if (res == 5) {
	                                        	$.messager.alert("提示","注册失败（原因：邮箱已存在，请再输入一个不同的）！","error");
	                                        }
	                                    },
	                                    error:function(res){
	                                        $.messager.alert("提示","注册失败！","error");
	                                    }
	                                })
	                            } else {
	                                // 未选择图片的ajax
	                                alert(1)
	                                $.ajax({
	                                    url:"../insertSignUpEmployeeNotHaveImage",
	                                    type:"post",
	                                    data:{
	                                        e_loginName:e_loginName,
	                                        e_passWord:e_passWord,
	                                        e_protectMTel:e_protectMTel,
	                                        e_protectEmail:e_protectEmail,
	                                        e_sex:e_sex,
	                                        e_age:e_age
	                                    },
	                                    success:function(res){
	                                    	if (res == 1) {
                                                $.messager.alert("提示","注册成功！","info");
                                            } else if (res == 2) {
                                                $.messager.alert("提示","注册失败！","error");
                                            } else if (res == 3) {
                                                $.messager.alert("提示","注册失败（原因：登录名已存在，请再输入一个不同的）！","error");
                                            } else if (res == 4) {
                                                $.messager.alert("提示","注册失败（原因：手机号已存在，请再输入一个不同的）！","error");
                                            } else if (res == 5) {
                                                $.messager.alert("提示","注册失败（原因：邮箱已存在，请再输入一个不同的）！","error");
                                            }
	                                    },
	                                    error:function(res){
	                                        $.messager.alert("提示","注册失败！","error");
	                                    }
	                                })
	                            }
	                            
	                        } else {
	                            $.messager.alert("提示","请输入正确的邮箱！","error");
	                        }
	                    } else {
	                        $.messager.alert("提示","请输入正确的手机号！","error");
	                    }
	                } else {
	                    $.messager.alert("提示","两次输入的密码不一致！","error");
	                }
	            } else {
	            	$.messager.alert("提示","密码必须同时包含数字和字母！","error");
	            }
            } else {
                $.messager.alert("提示","密码至少为6位！","error");
            }
        } else {
            $.messager.alert("提示","请填入必输项！","error");
        }
    }
    
    // 密码的验证
    $.extend($.fn.validatebox.defaults.rules, {
        equals: {
            validator: function(value,param){
                return value == $(param[0]).val();
            },
            message:"两次输入密码不一致！"
        }
    });
    
    //删除员工
    function deleteEmployee(index){
		var data=$("#empTab").datagrid("getData");
		var row=data.rows[index];
		$.messager.confirm('确认','您确认想要删除吗？',function(r){    
		    if (r){    
		          $.post("../deleteEmployee",{e_id:row.e_id},function(res){
		        	  if(res>0){
		        		  $("#empTab").datagrid("reload");
		        		  $.messager.alert('确认','删除成功');
		        	  }else{
		        		  $.messager.alert('确认','该员工下有在跟进的学生删除失败');
		        	  }
		          },"json")  
		    }    
		});  

	}
    //重置密码
    function openResertPasswordDialog (index) {
		var data=$("#empTab").datagrid("getData");
        var row=data.rows[index];
        var e_loginName = row.e_loginName;
        
        $.messager.confirm("确认对话框","您确定要重置密码吗？（重置后的密码为：“ysd123”）", function(r){
            if (r){
            	$.post("../resertPassword",{
            		e_loginName:e_loginName
            		},function(res){
            			if (res > 0) {
                            $.messager.alert("提示","重置密码成功！","info");
                        } else {
                            $.messager.alert("提示","重置密码失败！","info");
                        }
            		},"json")
            }
        });
        
	}
    
 // 将用户状态更改为锁定的方法
	function lockEmployee(index) {
		var data = $("#empTab").datagrid("getData");
        var row = data.rows[index];
        var isLock = row.e_isLockOut;
        var e_loginName = row.e_loginName;
        
        if (isLock == "1") {
        	$.messager.alert("提示","该用户已经锁定，无需再锁定！","info");
        } else {
        	$.post("../setEmployeeLock",{
        		e_loginName:e_loginName
        	},function(res){
        		if (res > 0) {
        			$.messager.alert("提示","该用户已锁定！","info");
        			$("#empTab").datagrid("reload");
        		} else {
        			$.messager.alert("提示","用户锁定失败！","error");
        		}
        	},"json")
        }
	}
	
 // 将用户锁定状态更改为未锁定的方法
	function unlockEmployee(index) {
        var data = $("#empTab").datagrid("getData");
        var row = data.rows[index];
        var isLock = row.e_isLockOut;
        var e_loginName = row.e_loginName;
        
        if (isLock == "0" || isLock == null) {
            $.messager.alert("提示","该用户未锁定，无需再解锁！","info");
        } else {
            $.post("../setEmployeeUnLock",{
                e_loginName:e_loginName
            },function(res){
                if (res > 0) {
                    $.messager.alert("提示","该用户已解锁！","info");
                    $("#empTab").datagrid("reload");
                } else {
                    $.messager.alert("提示","用户解锁失败！","error");
                }
            },"json")
        }
    }
	
</script>
</head>
<body>
	<table id="empTab"></table>
	
	<div id="tb">
		<form  id="tabfrm" class="easyui-form">
	        <label for="name">用户名:</label>   
	        <input class="easyui-textbox" type="text"  id="e_loginName"/>   
	        
	        <label for="name">创建时间:</label>   
	        <input class="easyui-datebox" type="text"  id="in_e_createTime"/>~
	        <input class="easyui-datebox" type="text"  id="en_e_createTime"/>    
			
	       	<label for="name">是否锁定:</label>
	        <select id="e_isLockOut" class="easyui-combobox" style="width:100px;">   
			    <option value="">--请选择--</option>   
			    <option value="0">未锁定</option>   
			    <option value="1">已锁定</option>     
			</select>
			<a href="javascript:void(0)" onclick="init()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
			<a href="javascript:void(0)" onclick="openAddDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">创建新员工</a>
		</form>
	</div>
	
	<div id="updateDialog" class="easyui-dialog" title="修改" data-options="modal:true,closed:true,
			buttons:[{
				text:'保存',
				handler:function(){saveUpdat();}
			},{
				text:'关闭',
				handler:function(){closeUpdat();}
			}]">  
		<form id="updateForm" method="post">   
			<table>
			    <tr>
			        <td><label>登录名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updatee_loginName" name="e_loginName" data-options="disabled:true" /></td>
			    </tr>
			    <tr>
			        <td><label>密保邮箱：</label></td>
			        <td><input class= "easyui-textbox" type= "text" id="updatee_protectEmail" name="e_protectEmail" /></td>
			    </tr>
			    <tr>
			        <td><label>密保手机号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="updatee_protectMTel" name="e_protectMTel" /></td>
			    </tr>
		    </table>
		</form>  
	</div>
	
	<div class="easyui-dialog" id="updateRoleDialog" title="修改用户角色" style="width:auto;height:auto;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
	   <!-- <div id="allRoleDatalist" style="width:150px;float:left;"></div>
	   <button>》》</button>
	   <button>《《</button>
	   <div id="employeeRoleDatalist" style="width:150px;float:right;"></div> -->
	   <table>
	        <tr>
	            <td>所有角色</td>
	            <td></td>
	            <td>用户拥有的角色</td>
	        </tr>
		    <tr>
		        <td><div id="allRoleDatalist" style="height:200px;width:200px;"></div></td>
		        <td>
		            <button id="dl_add" class="easyui-linkbutton" style="width:50px;margin:5px;" onclick="removeRoleToEmployee()">>|</button><br />
		            <button id="dl_remove" class="easyui-linkbutton" style="width:50px;margin:5px;" onclick="removeEmployeeToAll()">|<</button>
		        </td>
		        <td><div id="employeeRoleDatalist" style="height:200px;width:200px;"></div></td>
		    </tr>
	   </table>
    </div>
	<div id="detailDialog" class="easyui-dialog" title="查看信息" style="width:400px;height:400px;"  data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<form id="detailForm" method="post">   
			<table>
			    <tr>
			        <td><label>编号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_id" name="e_id" /></td>
			    </tr>
			    <tr>
			        <td><label>登录名：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_loginName" name="e_loginName" /></td>
			    </tr>
			    <tr>
			        <td><label>是否锁定：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_isLockOut" name="e_isLockOut" /></td>
			    </tr>
			    <tr>
			        <td><label>最后一次登录时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_lastLoginTime" name="e_lastLoginTime" /></td>
			    </tr>
			    <tr>
			        <td><label>创建时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_createTime" name="e_createTime" /></td>
			    </tr>
			    <tr>
			        <td><label>密码错误次数：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_pwdWrongTime" name="e_pwdWrongTime" /></td>
			    </tr>
			    <tr>
			        <td><label>被锁定时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_lockTime" name="e_lockTime" /></td>
			    </tr>
			    <tr>
			        <td><label>密保邮箱：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_protectEmail" name="e_protectEmail" /></td>
			    </tr>
			    <tr>
			        <td><label>密保手机号：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_protectMTel" name="e_protectMTel" /></td>
			    </tr>
			    <tr>
			        <td><label>员工现住址：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_liveAddress" name="e_liveAddress" /></td>
			    </tr>
			    <tr>
			        <td><label>员工性别：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_sex" name="e_sex" /></td>
			    </tr>
			    <tr>
			        <td><label>员工年龄：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_age" name="e_age" /></td>
			    </tr>
			    <tr>
			        <td><label>员工照片：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_photo" name="e_photo" /></td>
			    </tr>
			    <tr>
			        <td><label>是否结婚：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_isMarry" name="e_isMarry" /></td>
			    </tr> 
			    <tr>
			        <td><label>员工籍贯：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_fromAddress" name="e_fromAddress" /></td>
			    </tr>
			    <tr>
			        <td><label>学历状态：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_eduStatus" name="e_eduStatus" /></td>
			    </tr>
			    <tr>
			        <td><label>员工微信：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_weiXin" name="e_weiXin" /></td>
			    </tr>
			    <tr>
			        <td><label>入职时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_inCompanyTime" name="e_inCompanyTime" /></td>
			    </tr>
			    <tr>
			        <td><label>离职时间：</label></td>
			        <td><input class="easyui-textbox" type="text" id="e_leaveCompanyTime" name="e_leaveCompanyTime" /></td>
			    </tr>
			    <tr>
			    	<td></td>
			        <td><a href="javascript:void(0)" class="easyui-linkbutton" id="btn" onclick="detailClose()" style="width:100px">关闭</a></td>
			    </tr>
		    </table>
		</form>  
	</div>
	
	
	
	<div id="signUpDialog" >
        <form id="signUpForm" method="post" enctype="multipart/form-data">
            <table id="signUpTable" style="margin-left:30px;">
                <tr>
                    <td style="width:80px;">登录名：</td>
                    <td><input class="easyui-textbox" id="e_loginNameSignUp" style="width:200px" required="required"></td>
                </tr>
                <tr>
                    <td>登录密码：</td>
                    <td><input type="password" class="easyui-textbox validatebox" id="e_passWordSignUp" style="width:200px" required="required"><span>&nbsp;密码最少6位并同时包含字母和数字</span></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input type="password" class="easyui-textbox validatebox" id="e_retypePassWordSignUp" style="width:200px" required="required" validType="equals['#e_passWordSignUp']" /></td>
                </tr>
                <tr>
                    <td>手机号：</td>
                    <td><input class="easyui-textbox" id="e_protectMTelSignUp" style="width:200px" required="required"></td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td><input class="easyui-textbox" id="e_protectEmailSignUp" style="width:200px" required="required"></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <!-- <input class="easyui-textbox" id="e_sex" style="width:200px"> -->
                        <input name="e_sexSignUp" id="e_sexSignUp" type="radio" value="1" />男
                        <input name="e_sexSignUp" id="e_sexSignUp" type="radio" value="0" />女
                    </td>
                </tr>
                <tr>
                    <td>年龄：</td>
                    <td><input class="easyui-textbox" id="e_ageSignUp" style="width:200px"></td>
                </tr>
                <tr>
                    <td>照片：</td>
                    <td>
                                           只能上传<span style="color:red;"><b>一寸(295px*413px)</b></span>
                                            ,不大于<span style="color:red;"><b>2MB</b></span>的
                        <span style="color:red;"><b>.jpg</b></span>或<span style="color:red;"><b>.png</b></span>
                                           类型图片<br/>
                        <input type="file" id="e_photoSignUp" style="width:200px;height:" onchange="fileChange(this)">
                    </td>
                </tr>
                <tr>
                	<td style="width:90px;">照片预览：</td>
                    <td><img id="previewImage"></td>
                </tr>
            </table>
            <div id="signUpButtonsDiv" style="margin-left:130px;margin-top:20px;">
                <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" onclick="clearSignUpForm()">清空所填数据</a>
                <a href="javascript:void(0);" type="button" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="signUp()">确定</a>
                <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="closeSignUpDialog()">取消</a>
            </div>
        </form>
    </div>
	
</body>
</html>