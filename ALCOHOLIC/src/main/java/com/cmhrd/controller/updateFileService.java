package com.cmhrd.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;
//
//application/x-www-form-urlencoded : 모든 문자를 서버로 전송하기 전에 인코딩
//(form 태그 기본값)
//multipart/form-data : 모든 문자를 인코딩하지 않음 [HTTP 요청 페이지의 body에 잇는 여러 개의 파트로 구성된 데이터]
//(원본 데이터가 유지되어 이미지, 파일 등을 서버로 전송할 수 있음)

@MultipartConfig(fileSizeThreshold = 1024 * 1024,    // 1MB 이 크기가 넘으면 임시 디렉토리에 저장
                 maxFileSize = 1024 * 1024 * 5,      // 5MB 파일의 최대 크기
                 maxRequestSize = 1024 * 1024 * 10)  // 10MB 한 요청의 최대크기 ,여러파일 및 전송값 등을 합한 최대 크기
public class updateFileService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       

           request.setCharacterEncoding("UTF-8");
           response.setCharacterEncoding("UTF-8");
           response.setContentType("text/html; charset=UTF-8");

           // 세션에서 사용자 닉네임 불러오기
           
           HttpSession session = request.getSession();
           userDTO user = (userDTO)session.getAttribute("UserInfo");
           System.out.println(user.getUser_nick());

           // 파일 업로드 경로 설정 (프로젝트 내의 images 폴더에 저장)
           // getServletContext().getRealPath("") -> 서버 파일 시스템에서 웹 애플리케이션 루트 디렉터리의 실제 경로를 검색
           // 웹 어플리케이션의 배포 디렉토리가 변경되더라도 어플리케이션 코드를 수정할 필요 없이 정확한 경로를 얻을 수 있도록 하는데 사용
           //  File.separator -> 파일 구분자 : 디렉토리 경로를 연결 ( '\' Windows 및 '/' Unix 계열 시스템에서 반환.)
           String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
           File uploadDir = new File(uploadPath);
           // uploadDir가 존재하지않으면 디렉토리를 생성
           if (!uploadDir.exists()) {
               uploadDir.mkdir();
           }

           // 클라이언트로부터 이미지 파일 받기
           // part -> multipart/form-data HTTP 요청의 일부 또는 여러 부분
           // filePart.getSubmittedFileName(); -> 지정된 업로드 파일의 원본 파일 이름을 검색
           Part filePart = request.getPart("imgg");
           String fileName = filePart.getSubmittedFileName();

           // 파일을 지정된 경로에 저장
           // File : 파일 시스템의 파일 또는 디렉터리 경로 이름
           // uploadPath - 업로드된 파일이 저장될 디렉터리
           // file 업로드된 파일이 저장될 경로를 담아줌
           File file = new File(uploadPath + File.separator + fileName);
           // filePart.getInputStream(): 업로드된 파일의 콘텐츠가 포함된 입력 스트림을 검색
           try (InputStream fileContent = filePart.getInputStream()) {
              // Files.copy(...) : 입력 스트림()의 내용을 저장할 파일을 나타내는 fileContent지정된 경로()에 복사. file.toPath()
              // StandardCopyOption.REPLACE_EXISTING : file이 이미 존재하는 경우 복사한 내용으로 대체해야 함.
               Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
           } catch (IOException e) {
               e.printStackTrace();
           }

           // 데이터베이스에 파일 이름 저장 (이 부분은 실제 구현에 맞게 수정해야 함)
           
           user.setUser_img(fileName);  // 사용자 객체에 이미지 파일 이름 설정
           cocDAO dao = new cocDAO();
           int updateResult = dao.updateUserImage(user);  // 사용자 이미지 업데이트 메소드 호출

        System.out.println(updateResult);
        if(updateResult > 0) {
           // 성공적으로 이미지가 업로드되었음을 사용자에게 알림
           response.getWriter().println("이미지 업로드 완료: " + fileName);
           
        }else {
           response.getWriter().println("이미지 업로드 실패: " + "요청이 너무 많습니다.");
        }

        
    }
}
