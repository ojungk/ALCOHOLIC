package com.cmhrd.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;
import com.smhrd.model.usercocDTO;
@MultipartConfig
public class FeedUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if (request.getMethod().equalsIgnoreCase("POST")) {
	            handlePostRequest(request, response);
	        } else {
	            super.service(request, response);
	        }
	    }
	private void handlePostRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		 String title = request.getParameter("feed_title");
	        String feed_ing = request.getParameter("feed_ing");
	        String feed_rsp = request.getParameter("feed_rsp");
	        String feed_text = request.getParameter("feed_text");
	        Part imagePart = request.getPart("feed_img");
	        String imagePath = null;
	        if (imagePart != null && imagePart.getSize() > 0) {
	            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
	            imagePath = "uploads/" + fileName;
	            File uploadsDir = new File(getServletContext().getRealPath("/") + "uploads");
	            if (!uploadsDir.exists()) {
	                uploadsDir.mkdir();
	            }
	            imagePart.write(uploadsDir + File.separator + fileName);
	        }else {
	        	imagePath ="images/post_null.png";
	        }
	        usercocDTO dto = new usercocDTO();
	        cocDAO dao = new cocDAO();
	        dto.setUser_cocktail_content(feed_text);
	        dto.setUser_cocktail_img(imagePath);
	        dto.setUser_cocktail_ing(feed_ing);
	        dto.setUser_cocktail_title(title);
	        dto.setUser_cocktail_rsp(feed_rsp);
	        dto.setUser_id(u.getUser_id());
	        int a = dao.feedupload(dto);
	        if(a>0) {
	        	System.out.println("피드등록성공");
	        	response.sendRedirect("feed.jsp");
	        }else {
	        	System.out.println("피드등록실패");
	        }

	}

}
