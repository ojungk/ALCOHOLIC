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

public class deleteComment_feed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		  userDTO u = (userDTO) session.getAttribute("UserInfo"); 
		  int feed_idx =  Integer.parseInt(request.getParameter("feedIndex")); 
		  int comt_idx =  Integer.parseInt(request.getParameter("commentIndex"));
		  System.out.println(feed_idx);
		  user_coc_commentDTO dto = new user_coc_commentDTO();
		  cocDAO dao= new cocDAO();
		  dto.setCmt_idx(comt_idx); 
		  dto.setUser_ct_idx(feed_idx);
		  int a =  dao.delcomment_feed(dto); 
		  if (a>0) {
			  System.out.println("딜성");
			  }else {
		 System.out.println("딜실"); 
		 }
	}

}
