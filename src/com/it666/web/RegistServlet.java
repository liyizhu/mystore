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
		
		//��ȡ��֤��
		String code = request.getParameter("code");
		//��ȡ���������ɵ���֤��
		String word = (String)this.getServletContext().getAttribute("checkCode");
		//�ж��������֤���Ƿ���ȷ
		if(code.equals(word)) {
			//��֤����ȷ
			//�������в���
			Map<String, String[]> parameterMap = request.getParameterMap();
			
			//��װ��User����
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
			
			//����uid
			u.setUid(UUID.randomUUID().toString());
			
			//�����ݲ��뵽���ݿ�
			QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
			String sql = "insert into user value(?,?,?,?)";
			try {
				qr.update(sql,u.getUid(),u.getUsername(),u.getPassword(),u.getPhone());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//ע��ɹ� ��ת����½ҳ��
			response.getWriter().write("ע��ɹ�����������ص�½ҳ");
			response.setHeader("refresh", "3;url=/mystore/login.jsp");
		}else {
			//����ȷ �����û���֤����� ��������ת��ע��ҳ
			response.getWriter().write("��֤��������������ע��ҳ");
			response.setHeader("refresh", "3;url=/mystore/regist.jsp");
		}
	}

}
