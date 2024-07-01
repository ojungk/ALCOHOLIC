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

public class Checkheart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo"); 
		request.setCharacterEncoding("UTF-8");
		 int cocindex = Integer.parseInt(request.getParameter("num"));
		 System.out.println("췟"+cocindex);
		 cocDAO dao = new cocDAO();
		 coc_likeDTO dto = new coc_likeDTO();
		 dto.setCt_idx(cocindex);
		 dto.setUser_id(u.getUser_id());
		 coc_likeDTO like =null;
		 like = dao.checkheart(dto);
		 if(like!=null) {
			 response.getWriter().print(1);
			 
		 }else {
			 response.getWriter().print(2);
		 }
	}

}
