<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登陆界面</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <!--头部-->
    <div id="header">
        <div class="h_center">
            <img src="images/Myxq.jpg" alt="">
            <p>为确保您账户的安全及正常使用，依《网络安全法》的相关要求，6月1日起会员的账户需绑定手机。如您未绑定，请尽快完成，感谢您的理解与支持！</p>
        </div>
    </div>

    <!--中部-->
    <div id="login_body">
        <div class="login_b_center">
            <div class="login_bg">
                <h4>登陆</h4>
                <form action="${pageContext.request.contextPath}/LoginServlet" id="login" method="post">
                    <div class="username"><span></span><input id="username" name="username" type="text"></div>
                    <div class="password"><span></span><input id="password" name="password" type="password"></div>
                    <div class="login_btn"><input type="button" value="登陆" onclick="checkData(this)"></div>
                    <div class="forgot_pwd">
                        <a href="#">忘记密码</a>
                        <a href="#">忘记会员名</a>
                        <a href="#">免费注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="/footer.jsp" %>
    
<script type="text/javascript">
	
	function checkData(obj){
		//获取用户名 密码
		var username = document.getElementById("username");
		var password = document.getElementById("password");
		
		//判断输入的内容不能为空
		if(username.value==""){
			alert("请输入用户名");
			return;
		}
		
		if(password.value==""){
			alert("请输入密码");
			return;
		}
		
		var form = document.getElementById("login");
		form.submit();
		
	}
</script>    
</body>
</html>