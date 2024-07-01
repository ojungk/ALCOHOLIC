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
import com.smhrd.model.coc_commentDTO;
import com.smhrd.model.postDTO;
import com.smhrd.model.userDTO;

public class CommentLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		int idx = Integer.parseInt(request.getParameter("ct_index"));
		cocDAO dao = new cocDAO();
		coc_commentDTO dto = new coc_commentDTO();
		
		dto.setCt_idx(idx);
		List<coc_commentDTO> list = dao.loadcomment(dto);
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder json = new StringBuilder();
        if (list!=null) {
        json.append("[");
        for (int i = 0; i < list.size(); i++) {
        	coc_commentDTO post = list.get(i);
        	json.append("{");
            json.append("\"index\":\"").append(escapeJson(Integer.toString(post.getCt_idx()))).append("\",");
            json.append("\"cmtidx\":\"").append(escapeJson(Integer.toString(post.getCmt_idx()))).append("\",");
            json.append("\"at\":\"").append(escapeJson(post.getCreated_at())).append("\",");
            json.append("\"id\":\"").append(escapeJson(post.getUser_id())).append("\",");
            json.append("\"content\":\"").append(escapeJson(post.getCmt_content())).append("\",");
            userDTO ddto = new userDTO();
            ddto.setUser_id(post.getUser_id());
            userDTO usr = dao.getid(ddto);
            json.append("\"img\":\"").append(escapeJson(usr.getUser_img())).append("\"");
            json.append("}");
            if (i < list.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        out.print(json.toString());
        out.flush();
        }else {
        	System.out.println("못받았다고?");
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
