package com.cmhrd.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.smhrd.model.cocDAO;
import com.smhrd.model.usercocDTO;
@MultipartConfig
public class updateFeed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 Part feedIndexPart = request.getPart("feedIndex");
	     Part contentPart = request.getPart("content");
	     Part imagPart = request.getPart("img");
	     Part rspPart = request.getPart("rsp");
	     Part title = request.getPart("title");
	     Part ingPart = request.getPart("ing");
	     
	     String feedIndexStr = feedIndexPart != null ? new String(feedIndexPart.getInputStream().readAllBytes(), "UTF-8") : null;
	     String updatedContent = contentPart != null ? new String(contentPart.getInputStream().readAllBytes(), "UTF-8") : null;
	     String rspStr = rspPart != null ? new String(rspPart.getInputStream().readAllBytes(), "UTF-8") : null;
	     String titleStr = title != null ? new String(title.getInputStream().readAllBytes(), "UTF-8") : null;
	     String ingStr = ingPart != null ? new String(ingPart.getInputStream().readAllBytes(), "UTF-8") : null;
	     
	
	    	    System.out.println("Received feedIndex: " + feedIndexStr);
	    	    System.out.println("Received updatedContent: " + updatedContent);
	    	    System.out.println("Received rspStr: " + rspStr);
	    	    System.out.println("Received titleStr: " + titleStr);
	    	    System.out.println("Received ingStr: " + ingStr);
	     
	     int feedIndex = -1;
	        try {
	        	feedIndex = Integer.parseInt(feedIndexStr);
	        } catch (NumberFormatException e) {
	            throw new IllegalArgumentException("feedIndex를 정수로 변환할 수 없습니다.", e);
	        }

	        cocDAO dao = new cocDAO();
	        usercocDTO dto = new usercocDTO();
	        String imagePath = null;
	        if (imagPart != null && imagPart.getSize() > 0) {
	            String fileName = Paths.get(imagPart.getSubmittedFileName()).getFileName().toString();
	            imagePath = "uploads/" + fileName;
	            File uploadsDir = new File(getServletContext().getRealPath("/") + "uploads");
	            if (!uploadsDir.exists()) {
	                uploadsDir.mkdir();
	            }
	            imagPart.write(uploadsDir + File.separator + fileName);
	        }
	        dto.setUser_ct_idx(feedIndex);
	        dto.setUser_cocktail_content(updatedContent);
	        dto.setUser_cocktail_ing(ingStr);
	        dto.setUser_cocktail_rsp(rspStr);
	        dto.setUser_cocktail_title(titleStr);
	        if (imagePath != null) {
	            dto.setUser_cocktail_img(imagePath);
	            dao.upFeed(dto);
	        } else {
	            dao.upFeednoimg(dto);
	        }
	        
	        
	}

}
