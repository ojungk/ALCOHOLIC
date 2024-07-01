package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.coc_likeDTO;
import com.smhrd.model.userDTO;

public class cocktailheart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo"); 
		request.setCharacterEncoding("UTF-8");
		 int cocindex = Integer.parseInt(request.getParameter("num"));
		 cocDAO dao = new cocDAO();
		 coc_likeDTO dto = new coc_likeDTO();
		 dto.setCt_idx(cocindex);
		 dto.setUser_id(u.getUser_id());
		 int q = dao.heart(dto);
		 response.setContentType("text/html; charset=UTF-8"); 
		 if(q>0) {
			 response.getWriter().print(q);
			 
		 }else {
		 }
		 
	}

}
