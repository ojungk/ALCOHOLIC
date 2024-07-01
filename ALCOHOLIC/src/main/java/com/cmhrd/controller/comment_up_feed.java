package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;
import com.smhrd.model.user_coc_commentDTO;

public class comment_up_feed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		String text = request.getParameter("comment_text");
		int idx = Integer.parseInt(request.getParameter("feedIndex"));
		cocDAO dao = new cocDAO();
		user_coc_commentDTO dto = new user_coc_commentDTO();
		dto.setUser_ct_idx(idx);
		dto.setCmt_content(text);
		dto.setUser_id(u.getUser_id());
		int a  = dao.comment_up_feed(dto);
		if (a>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}

}
