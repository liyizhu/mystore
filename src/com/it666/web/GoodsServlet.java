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
		
//		  //�������ݿ� 
//		  QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
//		  
//		  //�����ݿ���ȡ���� 
//		  String sql = "select * from goods"; 
//		  List<Goods> allGoods = null;
//		  try { allGoods = qr.query(sql, new BeanListHandler<Goods>(Goods.class)); }
//		  catch (SQLException e) { // TODO Auto-generated catch block
//		  e.printStackTrace(); }
//		  
//		  //System.out.println(allGoods);
//		  
//		  //�����ݴ洢��request���� request.setAttribute("allGoods", allGoods);
//		  
//		  //ת������Ʒ�б�ҳ�棬ת��ʱ��request������
//		  request.getRequestDispatcher("/goods_list.jsp").forward(request, response);
		 
		 GoodsService goodsService = new GoodsService();
		 List<Goods> allGoods = goodsService.findAllGoods();
		 System.out.println(allGoods);
		 request.setAttribute("allGoods", allGoods);
		  
		 //ת������Ʒ�б�ҳ�棬ת��ʱ��request������
		 request.getRequestDispatcher("/goods_list.jsp").forward(request, response);
	}

}
