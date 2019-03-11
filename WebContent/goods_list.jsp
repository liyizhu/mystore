<%@page import="com.it666.domain.Goods"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>蚂蚁商城</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/goods_list.css">
    <link rel="stylesheet" href="css/pageStyle.css">
</head>
<body>

<!-- 通过 jsp 指令导入头部 -->
<%@ include file="/header.jsp" %>

<!--热卖商品-->
<div id="hot_goods">
    <h3>热卖商品</h3>
    <div class="hot_goods_body">
        <ul>
        <%-- <%
        	//从域中取数据
        	List<Goods> allGoods = (List<Goods>)request.getAttribute("allGoods");
        	System.out.print(allGoods);
        	
        	if(allGoods!=null){
        		
        		for(Goods pro:allGoods){
        			out.write("<li>");
        			out.write("<a href='#'>");
        			out.write("<img src='images/pimages/"+pro.getImage()+"' alt=''>");
        			out.write("<p>"+ pro.getName() +"</p>");
        			out.write("<i class='yuan'>￥</i><span class='price'>"+pro.getPrice()+"</span>");
        			out.write("</a>");
        			out.write("</li>");
        		}
        		
        	}else{
        		out.write("没有商品");
        	}
        	
        %> --%>
        <c:if test="${empty allGoods }">
        	没有商品
        </c:if>
        
        <c:if test="${!empty allGoods }">
        	<c:forEach items="${allGoods }" var="good">
        		<li>
                	<a href="">
                    	<img src="images/pimages/${good.image }" alt="">
                    	<p>${good.name }</p>
                    	<i class="yuan">￥</i><span class="price">${good.price }</span>
                	</a>
            	</li>
        	</c:forEach>       	
        </c:if>
        </ul>
    </div>
</div>

<!--分页：1.引入pageStyle.css 2.html中想添加分页的位置写下以下代码 3.在尾部引入js
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/paging.js"></script>
    <script>
        //分页
        $("#page").paging({
            pageNo:3, /*当前选中的是哪一页*/
            totalPage:15,/*共多少页*/
            totalSize:300,/*共多少条记录*/
            callback:function (num) {
                console.log(num);/*num为点击的按钮的数字*/
            }
        })
    </script>
-->
<!--分页-->
<div id="page" class="page_div"></div>

<%@ include file="/footer.jsp" %>

<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
<script>
    //分页
    $("#page").paging({
        pageNo:3, /*当前选中的是哪一页*/
        totalPage:15,/*共多少页*/
        totalSize:300,/*共多少条记录*/
        callback:function (num) {
            console.log(num);/*num为点击的按钮的数字*/
        }
    })
</script>
</body>
</html>