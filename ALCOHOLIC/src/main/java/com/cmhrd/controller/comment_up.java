package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.coc_commentDTO;
import com.smhrd.model.userDTO;

public class comment_up extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		System.out.println("여기까진왔음");
		String text = request.getParameter("comment_text");
		int idx = Integer.parseInt(request.getParameter("ctIndex"));
		System.out.println("유저아이디는"+u.getUser_id()+"    인덱스번호 "+idx+"    댓글내용"+text);
		cocDAO dao = new cocDAO();
		coc_commentDTO dto = new coc_commentDTO();
		dto.setCt_idx(idx);
		dto.setUser_id(u.getUser_id());
		dto.setCmt_content(text);
		int a = dao.comment_up(dto);
		
		
	}

}
