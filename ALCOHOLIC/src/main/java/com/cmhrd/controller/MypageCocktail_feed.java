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
import com.smhrd.model.user_coc_commentDTO;
import com.smhrd.model.usercocDTO;

public class MypageCocktail_feed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		cocDAO dao = new cocDAO();
		usercocDTO dto = new usercocDTO();
		List<usercocDTO> list = null;
		list = dao.mypage_fd(u.getUser_id());
		System.out.println("불러온"+list);
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder json = new StringBuilder();
        json.append("[");
        for (int i = 0; i < list.size(); i++) {
            usercocDTO feed = list.get(i);
            json.append("{"); // 각 객체의 시작
            json.append("\"index\":\"").append(escapeJson(Integer.toString(feed.getUser_ct_idx()))).append("\",");
            json.append("\"title\":\"").append(escapeJson(feed.getUser_cocktail_title())).append("\",");
            json.append("\"text\":\"").append(escapeJson(feed.getUser_cocktail_content())).append("\",");
            json.append("\"img\":\"").append(escapeJson(feed.getUser_cocktail_img())).append("\",");
            json.append("\"at\":\"").append(escapeJson(feed.getUser_cocktail_at())).append("\",");
            json.append("\"id\":\"").append(escapeJson(feed.getUser_id())).append("\",");
            json.append("\"ing\":\"").append(escapeJson(feed.getUser_cocktail_ing())).append("\",");
            json.append("\"rsp\":\"").append(escapeJson(feed.getUser_cocktail_rsp())).append("\",");
            user_coc_commentDTO dto2 = new user_coc_commentDTO();
            int a = dao.user_comment_cnt(Integer.toString(feed.getUser_ct_idx()));
            json.append("\"cmtcnt\":\"").append(a).append("\"");
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
