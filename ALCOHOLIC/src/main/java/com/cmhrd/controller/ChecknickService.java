package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.cocDAO;

public class ChecknickService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nickname = request.getParameter("user_nick");

		cocDAO dao = new cocDAO();
		int nickcheck = dao.nickCheck(nickname);

		if (nickcheck > 0) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(String.valueOf(nickcheck));
			System.out.println("사용 불가");
		} else {
			System.out.println("사용 가능");
		}

	}

}
