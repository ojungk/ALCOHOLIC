package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.post_commentDTO;
import com.smhrd.model.userDTO;

public class updateComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		int post_idx = Integer.parseInt(request.getParameter("postIndex"));
		int comt_idx = Integer.parseInt(request.getParameter("commentIndex"));
		String upcon = request.getParameter("updatedContent");
		post_commentDTO dto = new post_commentDTO();
		cocDAO dao = new cocDAO();
		dto.setCmt_idx(comt_idx);
		dto.setCmt_content(upcon);
		dto.setPost_idx(post_idx);
		dao.updatepost(dto);
	}

}
