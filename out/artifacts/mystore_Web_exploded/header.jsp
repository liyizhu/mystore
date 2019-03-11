<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>蚂蚁商城</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<!--头部-->
<div id="header">
    <!--头部的顶部-->
    <div class="header_top">
        <div class="header_top_center">
            <div class="h_top_left">
                欢迎来到蚂蚁商城
            </div>
            <div class="h_top_right">
            <!-- 判断是否有用户 -->
            <c:if test="${empty user }">
            	<a href="login.jsp">登陆</a>
                <a href="regist.jsp">免费注册</a>
            </c:if>
            
            <c:if test="${!empty user }">
            	欢迎：${user.username }
            	<a href="${pageContext.request.contextPath}/ExitServlet">退出</a>
            </c:if>
                
                <a href="#">购物车</a>
                <a href="#">我的订单</a>
            </div>
        </div>
    </div>
    <!--头部的中部-->
    <div class="header_center">
        <div class="h_c_logo">
            <img src="images/logo.png" alt="">
        </div>

        <div class="h_c_search">
            <form action="#">
                <input type="text" placeholder="请输入搜索内容" class="t_input">
                <input type="submit" class="t_button">
            </form>
            <div class="hot">
                <a href="#">新款连衣裙</a>
                <a href="#">四件套</a>
                <a href="#">潮流T恤</a>
                <a href="#">时尚女鞋</a>
                <a href="#">短裙半身裙</a>
            </div>
        </div>

        <div class="h_c_code">
            <img src="images/pcode.png" alt="">
        </div>
    </div>
    <!--头部的底部导航条-->
    <div class="nav">
        <ul>
            <li><a href="#">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/GoodsServlet">电脑办公</a></li>
            <li><a href="#">家居家具</a></li>
            <li><a href="#">鲜果时光</a></li>
            <li><a href="#">图书音像</a></li>
            <li><a href="#">母婴孕婴</a></li>
        </ul>
    </div>
</div>
</body>
</html>