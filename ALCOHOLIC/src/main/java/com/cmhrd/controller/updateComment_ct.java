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

public class updateComment_ct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		  int ct_idx = Integer.parseInt(request.getParameter("ctIndex")); 
		  int comt_idx =Integer.parseInt(request.getParameter("commentIndex")); 
		  String upcon =request.getParameter("updatedContent");
		 
		
		  coc_commentDTO dto = new coc_commentDTO(); 
		  cocDAO dao = new cocDAO();
		  dto.setCmt_idx(comt_idx); 
		  dto.setCmt_content(upcon); 
		  dto.setCt_idx(ct_idx);
		  int a = dao.updatepost_ct(dto); 
		  if(a>0) { 
			  System.out.println("성");
			  }else {
		  System.out.println("실"); 
		  }
		 
	}

}
