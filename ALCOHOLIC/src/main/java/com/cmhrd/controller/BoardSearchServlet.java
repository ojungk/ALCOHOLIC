package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.cocDAO;
import com.smhrd.model.postDTO;
import org.json.JSONArray;
import org.json.JSONObject;

public class BoardSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String query = request.getParameter("query");
        System.out.println("검색어: " + query);

        // DAO 객체 생성 및 검색 로직 호출
        cocDAO boardDAO = new cocDAO();
        List<postDTO> searchResults = boardDAO.searchPost(query); // DAO에서 검색 메서드 호출
        System.out.println("검색 결과: " + searchResults);

        // 검색 결과를 JSON 형식으로 변환하여 클라이언트에 응답
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder json = new StringBuilder();
        if (searchResults!=null) {
        json.append("[");
        for (int i = 0; i < searchResults.size(); i++) {
            postDTO post = searchResults.get(i);
            json.append("{");
            json.append("\"index\":\"").append(escapeJson(Integer.toString(post.getPost_idx()))).append("\",");
            json.append("\"title\":\"").append(escapeJson(post.getPost_title())).append("\",");
            json.append("\"content\":\"").append(escapeJson(post.getPost_content())).append("\",");
            json.append("\"img\":\"").append(escapeJson(post.getPost_img())).append("\",");
            json.append("\"at\":\"").append(escapeJson(post.getCreated_at())).append("\",");
            json.append("\"id\":\"").append(escapeJson(post.getUser_id())).append("\",");
            json.append("\"views\":\"").append(escapeJson(Integer.toString(post.getPost_views()))).append("\"");
            json.append("}");
            if (i < searchResults.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        out.print(json.toString());
        out.flush();
        }else {
        	System.out.println("못받았다...?");
        }
        
        
        
       
}
private String escapeJson(String str) {
    if (str == null) {
        return "";
    }
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < str.length(); i++) {
        char c = str.charAt(i);
        switch (c) {
            case '"':
                sb.append("\\\"");
                break;
            case '\\':
                sb.append("\\\\");
                break;
            case '\b':
                sb.append("\\b");
                break;
            case '\f':
                sb.append("\\f");
                break;
            case '\n':
                sb.append("\\n");
                break;
            case '\r':
                sb.append("\\r");
                break;
            case '\t':
                sb.append("\\t");
                break;
            default:
                // 제어 문자는 제거
                if (c >= 0x00 && c <= 0x1F) {
                    // Do nothing, skip this character
                } else {
                    sb.append(c);
                }
        }
    }
    return sb.toString();
    }
}
