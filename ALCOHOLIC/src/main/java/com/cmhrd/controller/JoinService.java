package com.cmhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;


public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String nickname = request.getParameter("user_nick");
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String phonenumber = request.getParameter("user_phone");
		
		userDTO user = new userDTO();
		user.setUser_id(id);
		user.setUser_pw(pw);
		user.setUser_nick(nickname);
		user.setUser_phone(phonenumber);
		
		
		cocDAO dao = new cocDAO();
		
		int row = dao.join(user);
		
		if(row>0) {
			
			response.sendRedirect("login.jsp");
			System.out.println("회원가입 성공");
		}else {
			
			
			System.out.println("con 회원가입 실패");
			
		}
		
		
	}

}