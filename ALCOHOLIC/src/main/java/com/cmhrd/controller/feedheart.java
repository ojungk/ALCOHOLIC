package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;
import com.smhrd.model.user_coc_likeDTO;

public class feedheart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo"); 
		request.setCharacterEncoding("UTF-8");
		 int cocindex = Integer.parseInt(request.getParameter("num"));
		 cocDAO dao = new cocDAO();
		 user_coc_likeDTO dto = new user_coc_likeDTO();
		 dto.setUser_ct_idx(cocindex);
		 dto.setUser_id(u.getUser_id());
		 int q = dao.heart_feed(dto);
		 response.setContentType("text/html; charset=UTF-8"); 
		 if(q>0) {
			 response.getWriter().print(q);
			 
		 }else {
		 }
	}

}
