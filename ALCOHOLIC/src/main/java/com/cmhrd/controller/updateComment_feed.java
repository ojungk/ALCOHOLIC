package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.user_coc_commentDTO;

public class updateComment_feed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		  int feed_idx = Integer.parseInt(request.getParameter("feedIndex")); 
		  int comt_idx =Integer.parseInt(request.getParameter("commentIndex")); 
		  String upcon =request.getParameter("updatedContent");
		  user_coc_commentDTO dto = new user_coc_commentDTO();
		  System.out.println("확인용"+feed_idx);
		  System.out.println("확인용"+comt_idx);
		  System.out.println("확인용"+upcon);
		  cocDAO dao = new cocDAO();
		  dto.setCmt_content(upcon);
		  dto.setCmt_idx(comt_idx);
		  dto.setUser_ct_idx(feed_idx);
		  int a = dao.updatepost_feed(dto); 
		  if(a>0) { 
			  System.out.println("성");
			  }else {
		  System.out.println("실"); 
		  }
	}

}
