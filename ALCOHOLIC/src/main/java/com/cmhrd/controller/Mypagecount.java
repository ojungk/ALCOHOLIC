package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;

public class Mypagecount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		request.setCharacterEncoding("UTF-8");
		cocDAO dao = new cocDAO();
		int count = 0;
		count = dao.ct_like_count(u.getUser_id());
		System.out.println(count);
		 response.setContentType("text/html; charset=UTF-8"); 
		 response.getWriter().print(count);
	}

}
