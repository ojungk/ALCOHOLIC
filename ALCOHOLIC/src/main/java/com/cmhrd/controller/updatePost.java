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
import com.smhrd.model.postDTO;
@MultipartConfig
public class updatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");

	        Part postIndexPart = request.getPart("postIndex");
	        Part contentPart = request.getPart("content");
	        Part imagePart = request.getPart("image");

	        String postIndexStr = postIndexPart != null ? new String(postIndexPart.getInputStream().readAllBytes(), "UTF-8") : null;
	        String updatedContent = contentPart != null ? new String(contentPart.getInputStream().readAllBytes(), "UTF-8") : null;

	        // 디버그 로그 추가
	        System.out.println("postIndexStr: " + postIndexStr);
	        System.out.println("updatedContent: " + updatedContent);

	        // 예외 처리 추가: postIndex가 null인지 확인하고 파싱 오류 처리
	        if (postIndexStr == null || postIndexStr.isEmpty()) {
	            throw new IllegalArgumentException("postIndex 파라미터가 전송되지 않았습니다.");
	        }

	        int postIndex = -1;
	        try {
	            postIndex = Integer.parseInt(postIndexStr);
	        } catch (NumberFormatException e) {
	            throw new IllegalArgumentException("postIndex를 정수로 변환할 수 없습니다.", e);
	        }

	        cocDAO dao = new cocDAO();
	        postDTO dto = new postDTO();

	        // 이미지 업로드 처리
	        String imagePath = null;
	        if (imagePart != null && imagePart.getSize() > 0) {
	            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
	            imagePath = "uploads/" + fileName;
	            File uploadsDir = new File(getServletContext().getRealPath("/") + "uploads");
	            if (!uploadsDir.exists()) {
	                uploadsDir.mkdir();
	            }
	            imagePart.write(uploadsDir + File.separator + fileName);
	        }

	        // 게시물 DTO에 데이터 설정
	        dto.setPost_idx(postIndex);
	        dto.setPost_content(updatedContent);
	        if (imagePath != null) {
	            dto.setPost_img(imagePath);
	            dao.upPost(dto);
	        } else {
	            dao.upPostnoimg(dto);
	        }
	    }
	}