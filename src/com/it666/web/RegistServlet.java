package com.it666.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;

import com.it666.domain.User;
import com.it666.util.JdbcUtil;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取验证码
		String code = request.getParameter("code");
		//获取服务器生成的验证码
		String word = (String)this.getServletContext().getAttribute("checkCode");
		//判断输入的验证码是否正确
		if(code.equals(word)) {
			//验证码正确
			//接收所有参数
			Map<String, String[]> parameterMap = request.getParameterMap();
			
			//封装成User对象
			User u = new User();
			try {
				BeanUtils.populate(u, parameterMap);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//设置uid
			u.setUid(UUID.randomUUID().toString());
			
			//将数据插入到数据库
			QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
			String sql = "insert into user value(?,?,?,?)";
			try {
				qr.update(sql,u.getUid(),u.getUsername(),u.getPassword(),u.getPhone());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//注册成功 跳转到登陆页面
			response.getWriter().write("注册成功，三秒后跳回登陆页");
			response.setHeader("refresh", "3;url=/mystore/login.jsp");
		}else {
			//不正确 告诉用户验证码错误 隔三秒跳转会注销页
			response.getWriter().write("验证码错误，三秒后跳回注册页");
			response.setHeader("refresh", "3;url=/mystore/regist.jsp");
		}
	}

}
