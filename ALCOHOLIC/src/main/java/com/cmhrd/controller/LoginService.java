package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.userDTO;
import com.smhrd.model.cocDAO;

public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		System.out.println(id);
		cocDAO dao = new cocDAO();
		
		userDTO u = new userDTO();
		u.setUser_id(id);
		u.setUser_pw(pw);
		userDTO user = dao.login(u);
		
		
		if(user != null) {
			session.setAttribute("UserInfo",user);
		
			response.sendRedirect("welcome.jsp");
			
			
			
			System.out.println("con 로그인 성공");
			
		}else {
			response.sendRedirect("login.jsp?loginFailed=true");
			System.out.println("con 로그인 실패");
			
		}
		
			
	}

}