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
import com.smhrd.model.user_coc_likeDTO;

public class Checkheart_feed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo"); 
		request.setCharacterEncoding("UTF-8");
		 int cocindex = Integer.parseInt(request.getParameter("num"));
		 System.out.println(cocindex);
		 cocDAO dao = new cocDAO();
		 user_coc_likeDTO dto = new user_coc_likeDTO();
		 dto.setUser_ct_idx(cocindex);
		 dto.setUser_id(u.getUser_id());
		 user_coc_likeDTO like =null;
		 like = dao.checkheart_feed(dto);
		 if(like!=null) {
			 response.getWriter().print(1);
			 
		 }else {
			 response.getWriter().print(2);
		 }

	}

}
