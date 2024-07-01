package com.cmhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.cocDAO;
import com.smhrd.model.usercocDTO;

public class deleteFeed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int feed_idx = Integer.parseInt(request.getParameter("feedIndex"));
		System.out.println("피드인덱스"+feed_idx);
		usercocDTO dto = new usercocDTO();
		usercocDTO dto2 = new usercocDTO();
		cocDAO dao = new cocDAO();
		dto.setUser_ct_idx(feed_idx);
		
		dao.delfeed_heart(feed_idx);
		dao.delcomt_feed(feed_idx);
		
			dao.delfeed(feed_idx);
		
		
	}

}
