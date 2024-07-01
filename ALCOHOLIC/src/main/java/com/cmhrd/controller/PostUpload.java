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
import com.smhrd.model.postDTO;
import com.smhrd.model.userDTO;
@MultipartConfig
public class PostUpload extends HttpServlet {
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
		 String title = request.getParameter("post_title");
	        String content = request.getParameter("post_dp");
	        Part imagePart = request.getPart("post_img");

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
	        postDTO post = new postDTO();
	        cocDAO dao = new cocDAO();
	        post.setPost_title(title);
	        post.setPost_content(content);
	        post.setPost_img(imagePath);
	        post.setUser_id(u.getUser_id());

	        int cnt = dao.savePost(post);
	        if(cnt>0) {
	        	System.out.println("업로드성공");
	        	response.sendRedirect("board.jsp");
	        }else {
	        	System.out.println("업로드실패");
	        }
	
	
	}

}
