package com.it666.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.it666.domain.Goods;
import com.it666.service.GoodsService;

@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		  //连接数据库 
//		  QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
//		  
//		  //从数据库中取数据 
//		  String sql = "select * from goods"; 
//		  List<Goods> allGoods = null;
//		  try { allGoods = qr.query(sql, new BeanListHandler<Goods>(Goods.class)); }
//		  catch (SQLException e) { // TODO Auto-generated catch block
//		  e.printStackTrace(); }
//		  
//		  //System.out.println(allGoods);
//		  
//		  //把数据存储到request域中 request.setAttribute("allGoods", allGoods);
//		  
//		  //转发到商品列表页面，转发时把request对象传入
//		  request.getRequestDispatcher("/goods_list.jsp").forward(request, response);
		 
		 GoodsService goodsService = new GoodsService();
		 List<Goods> allGoods = goodsService.findAllGoods();
		 System.out.println(allGoods);
		 request.setAttribute("allGoods", allGoods);
		  
		 //转发到商品列表页面，转发时把request对象传入
		 request.getRequestDispatcher("/goods_list.jsp").forward(request, response);
	}

}
