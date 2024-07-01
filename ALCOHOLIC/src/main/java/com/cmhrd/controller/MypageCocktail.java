package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.cocDTO;
import com.smhrd.model.userDTO;

public class MypageCocktail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		cocDAO dao = new cocDAO();
		cocDTO dto = new cocDTO();
		List<cocDTO> list = null;
		list = dao.mypage_ct(u.getUser_id());
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder json = new StringBuilder();
        json.append("[");
        for (int i = 0; i < list.size(); i++) {
            cocDTO coctail = list.get(i);
            json.append("{");
            json.append("\"name\":\"").append(escapeJson(coctail.getCt_kor_name())).append("\",");
            json.append("\"ename\":\"").append(escapeJson(coctail.getCt_eng_name())).append("\",");
            json.append("\"description\":\"").append(escapeJson(coctail.getCt_info())).append("\",");
            json.append("\"ABV\":\"").append(escapeJson(coctail.getCt_percent())).append("\",");
            json.append("\"ing\":\"").append(escapeJson(coctail.getCt_ingredient())).append("\",");
            json.append("\"rsp\":\"").append(escapeJson(coctail.getCt_recipe())).append("\",");
            json.append("\"index\":\"").append(escapeJson(Integer.toString(coctail.getCt_idx()))).append("\",");
            json.append("\"image\":\"").append(escapeJson(coctail.getCt_img())).append("\"");
            
            json.append("}");
            if (i < list.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        out.print(json.toString());
        out.flush();
        
        
       
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
