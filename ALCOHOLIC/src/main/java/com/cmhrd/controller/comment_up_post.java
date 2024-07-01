package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.coc_commentDTO;
import com.smhrd.model.post_commentDTO;
import com.smhrd.model.userDTO;

public class comment_up_post extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		String text = request.getParameter("comment_text");
		int idx = Integer.parseInt(request.getParameter("postIndex"));
		cocDAO dao = new cocDAO();
		post_commentDTO dto = new post_commentDTO();
		dto.setPost_idx(idx);
		dto.setUser_id(u.getUser_id());
		dto.setCmt_content(text);
		int a = dao.comment_up_post(dto);
	}

}
