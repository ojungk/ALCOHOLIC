package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.cocDAO;

public class deletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int post_idx = Integer.parseInt(request.getParameter("postIndex"));
		cocDAO dao = new cocDAO();
		
		int b = dao.delcomt(post_idx);
		 dao.delpost(post_idx);
		
		if (b>0) {
			int a =  dao.delpost(post_idx);
			
		}else {
			
	
	}
	}

}
