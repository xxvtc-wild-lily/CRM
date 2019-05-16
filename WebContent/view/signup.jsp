<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        $("#signUpDialog").dialog({
            title:"注册",
            width:600,
            height:560,
            modal:true
        })
    })
    
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
        var e_loginName = $("#e_loginName").val();
        var e_passWord = $("#e_passWord").val();
        var e_retypePassWord = $("#e_retypePassWord").val();
        var e_protectMTel = $("#e_protectMTel").val();
        var e_protectEmail = $("#e_protectEmail").val();
        
        // 判断手机号的正则表达式
        var regMTel=/^[1][3,4,5,7,8][0-9]{9}$/;
        // 判断邮箱的正则表达式
        var regEmail = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        
        // 设置判断，姓名密码为必填
        if (e_loginName != "" && e_loginName != null && e_loginName != undefined 
            && e_passWord != "" && e_passWord != null && e_passWord != undefined 
            && e_retypePassWord != "" && e_retypePassWord != null && e_retypePassWord != undefined 
            && e_protectMTel != "" && e_protectMTel != null && e_protectMTel != undefined 
            && e_protectEmail != "" && e_protectEmail != null && e_protectEmail != undefined) {
        	
        	// 判断输入的密码是否为6位或以上
        	if (e_passWord.length >= 6) {
        		// 判断两次输入的密码是否一致
	        	if (e_passWord==e_retypePassWord) {
		            // 判断手机号是否正确
		            if (regMTel.test(e_protectMTel)) {
		                // 判断邮箱是否正确
		                if (regEmail.test(e_protectEmail)) {
		                    // 拿到选中的性别，如果没有则为undefined
		                    var e_sex = $('input[name="e_sex"]:checked').val();
		                    var e_age = $("#e_age").val();
		                    
		                    if (e_age != null && e_age != "" && e_age != " " && e_age != undefined) {
		                    	 // 判断年龄是否在18~100岁之间
	                            if (e_age >=18 && e_age<=100) {
	                                e_age = $("#e_age").val();
	                            } else {
	                                $.messager.alert("提示","年龄应在18~100岁之间！","error");
	                                return;
	                            }
		                    }
		                    
		                    // 获取拿到的file
                            var e_photo = $("#e_photo").get(0).files[0];
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
                                        if (res == 0){
                                            $.messager.alert("提示","注册成功！","info");
                                        } else if(res == 1){
                                            $.messager.alert("提示","注册失败！（原因：图片名重复，请再试一次）","error");
                                        } else if(res == 2){
                                            $.messager.alert("提示","注册失败！","error");
                                        } else if(res == 3){
                                            $.messager.alert("提示","注册失败（原因：登录名已存在，请再输入一个不同的）！","error");
                                        }
                                    },
                                    error:function(res){
                                        $.messager.alert("提示","注册失败！","error");
                                    }
                                })
                            } else {
                                // 未选择图片的ajax
                                $.ajax({
                                    url:"../insertSignUpEmployeeNotHaveImage",
                                    type:"post",
                                    data:{
                                        e_loginName:e_loginName,
                                        e_passWord:e_passWord,
                                        e_sex:e_sex,
                                        e_age:e_age
                                    },
                                    success:function(res){
                                        if(res>0) {
                                            $.messager.alert("提示","注册成功！","info");
                                        } else if (res == -1) {
                                            $.messager.alert("提示","注册失败（原因：登录名已存在，请重新输入一个不同的）！","error");
                                        } else {
                                             $.messager.alert("提示","注册失败！","error");
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
        		$.messager.alert("提示","密码至少为6位！","error");
        	}
        } else {
            $.messager.alert("提示","请填入必输项！","error");
        }
    }
    
    $.extend($.fn.validatebox.defaults.rules, {
        equals: {
            validator: function(value,param){
                return value == $(param[0]).val();
            },
            message:"两次输入密码不一致！"
        }
    });
    
</script>
</head>
<body>
    <div id="signUpDialog">
        <form id="signUpForm" method="post" enctype="multipart/form-data">
            <table id="signUpTable" style="margin-left:70px;">
                <tr>
                    <td style="width:90px;">登录名：</td>
                    <td><input class="easyui-textbox" id="e_loginName" style="width:200px" required="required"></td>
                </tr>
                <tr>
                    <td>登录密码：</td>
                    <td><input type="password" class="easyui-textbox validatebox" id="e_passWord" style="width:200px" required="required"><span>&nbsp;密码应为6位及以上</span></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input type="password" class="easyui-textbox validatebox" id="e_retypePassWord" style="width:200px" required="required" validType="equals['#e_passWord']" /></td>
                </tr>
                <tr>
                    <td>手机号：</td>
                    <td><input class="easyui-textbox" id="e_protectMTel" style="width:200px" required="required"></td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td><input class="easyui-textbox" id="e_protectEmail" style="width:200px" required="required"></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <!-- <input class="easyui-textbox" id="e_sex" style="width:200px"> -->
                        <input name="e_sex" id="e_sex" type="radio" value="1" />男
                        <input name="e_sex" id="e_sex" type="radio" value="0" />女
                    </td>
                </tr>
                <tr>
                    <td>年龄：</td>
                    <td><input class="easyui-textbox" id="e_age" style="width:200px"></td>
                </tr>
                <tr>
                    <td>照片：</td>
                    <td>
                                           只能上传<span style="color:red;"><b>一寸(295px*413px)</b></span>
                                            ,不大于<span style="color:red;"><b>2MB</b></span>的
                        <span style="color:red;"><b>.jpg</b></span>或<span style="color:red;"><b>.png</b></span>
                                           类型图片<br/>
                        <input type="file" id="e_photo" style="width:200px;height:" onchange="fileChange(this)">
                    </td>
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