<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册界面</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/regist.css">
</head>
<body>
<!--头部-->
<div id="reg_header">
    <div class="reg_h_center">
        <div class="reg_h_left">
            <img src="images/logo.png" alt="">
            <h4>欢迎注册</h4>
        </div>
        <div class="reg_h_right">
            <a href="login.jsp">请登陆</a>
            <span>已有账号</span>
        </div>
    </div>
</div>

<!--表单内容-->
<div id="reg_content">
    <div class="reg_content_left">
        <form action="${pageContext.request.contextPath}/RegistServlet" id="reg_form" method="post">
            <div>
                <label>用户名</label>
                <input id="username" name="username" type="text" placeholder="请输入用户名">
            </div>

            <div>
                <label>密码</label>
                <input id="pwd" name="password" type="password" placeholder="请输入密码">
            </div>

            <div>
                <label>确认密码</label>
                <input id="pwd2" type="password" placeholder="请输入确认密码">
            </div>

            <div>
                <label>电话</label>
                <input id="phone" name="phone" type="text" placeholder="请输入电话">
            </div>

            <div class="check_box">
                <label>验证码</label>
                <input id="code" name="code" type="text" placeholder="请输入验证码">
                <img src="${pageContext.request.contextPath}/CheckCodeServlet" onclick="change(this)">
            </div>

            <div class="submit_button">
                <input type="button" value="立即注册" onclick="checkData(this)">
            </div>
        </form>
    </div>
    
    <div class="reg_content_right">
        <a href="#">
            <img src="images/reg_right.png" alt="">
        </a>
    </div>
</div>

<%@ include file="/footer.jsp" %>

<script type="text/javascript">
	function change(obj){
		obj.src = "/mystore/CheckCodeServlet?time=" + new Date().getTime();
	}
	
	function checkData(obj){
		//获取用户名 密码 确认密码
		var username = document.getElementById("username");
		var pwd = document.getElementById("pwd");
		var pwd2 = document.getElementById("pwd2");
		var phone = document.getElementById("phone");
		var code = document.getElementById("code");
		//判断输入的内容不能为空
		if(username.value==""){
			alert("请输入用户名");
			return;
		}
		
		if(pwd.value==""){
			alert("请输入密码");
			return;
		}
		
		if(pwd2.value==""){
			alert("请输入确认密码");
			return;
		}
		
		if(phone.value==""){
			alert("请输入电话号码");
			return;
		}
		
		if(code.value==""){
			alert("请输入验证码");
			return;
		}
		
		//判断两次密码是否一样
		if(pwd.value == pwd2.value){
			//发送请求
			var form = document.getElementById("reg_form");
			form.submit();
		}else{
			alert("两次输入的密码不一致");
		}	
	}
</script>
</body>
</html>