package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.smhrd.model.cocDAO;
import com.smhrd.model.cocDTO;
import com.smhrd.model.ingredientDTO;

public class cocktailType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
	        String type = request.getParameter("type");
	        cocDAO dao = new cocDAO();
	        List<cocDTO> list = null;
	        HttpSession session = request.getSession();
	        if (type.equals("럼")) {
	        	session.setAttribute("atype", "럼");
	        }else  if (type.equals("진")) {
	        	session.setAttribute("atype", "진");
	        }else  if (type.equals("데킬라")) {
	        	session.setAttribute("atype", "데킬라");
	        }else  if (type.equals("보드카")) {
	        	session.setAttribute("atype", "보드카");
	        }else  if (type.equals("브랜디")) {
	        	session.setAttribute("atype", "브랜디");
	        }else  if (type.equals("위스키")) {
	        	session.setAttribute("atype", "위스키");
	        }else  if (type.equals("기타")) {
	        	session.setAttribute("atype", "기타");
	        }else  if (type.equals("낮음 (0-10%)")) {
	        	String btype = type;;
	        	session.setAttribute("btype", btype);
	        }else  if (type.equals("중간 (10-20%)")) {
	        	System.out.println("작동");
	        	String btype = type;
	        	session.setAttribute("btype", btype);
	        }else  if (type.equals("높음 (20% 이상)")) {
	        	String btype = type;
	        	session.setAttribute("btype", btype);
	        }else  if (type.equals("전체")) {
	        	session.removeAttribute("atype");
	        	session.removeAttribute("btype");
	        }
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
	        if(session.getAttribute("atype")==null && session.getAttribute("btype")==null){
	        	//선택안할때
	        	list = dao.ct_all();
	        }else if(session.getAttribute("atype")==null && session.getAttribute("btype")!=null) {
	        	//알콜도수만선택
	        	String btype = (String)session.getAttribute("btype");
						list = dao.ct_btype(btype);
	        }else if(session.getAttribute("atype")!=null && session.getAttribute("btype")==null){
	        	//술종류만 선택
	        	String atype = (String)session.getAttribute("atype");
	        	list = dao.ct_atype(atype);
	        }else {
	        	//둘다선택
	        	String atype = (String)session.getAttribute("atype");
	        	String btype = (String)session.getAttribute("btype");
	        	list = dao.ct_abtype(atype, btype);
	        }
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
