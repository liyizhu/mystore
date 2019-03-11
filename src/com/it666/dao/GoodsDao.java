package com.it666.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.it666.domain.Goods;
import com.it666.util.JdbcUtil;

public class GoodsDao {
	public List<Goods> findAllGoods(){
		  //连接数据库 
		  QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
		  
		  //从数据库中取数据 
		  String sql = "select * from goods"; 
		  List<Goods> allGoods = null;
		  try { 
			  allGoods = qr.query(sql, new BeanListHandler<Goods>(Goods.class)); 
		  }catch (SQLException e) { 
			  // TODO Auto-generated catch block
			  e.printStackTrace(); 
		  }
		  return allGoods;
	}
}
