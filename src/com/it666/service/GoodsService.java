package com.it666.service;

import java.util.List;

import com.it666.dao.GoodsDao;
import com.it666.domain.Goods;

public class GoodsService {
	public List<Goods> findAllGoods(){
		GoodsDao goodsDao = new GoodsDao();
		return goodsDao.findAllGoods();
	}
}
