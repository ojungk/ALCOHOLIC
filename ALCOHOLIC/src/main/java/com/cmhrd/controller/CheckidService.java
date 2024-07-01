




package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;

public class CheckidService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("user_id");
		
		cocDAO dao = new cocDAO();
		int idcheck = dao.idCheck(id);
		
		if(idcheck > 0) {
			  response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(String.valueOf(idcheck));
			System.out.println("사용 불가");
		}else {
			System.out.println("사용 가능");
		}
		
		
	}

}