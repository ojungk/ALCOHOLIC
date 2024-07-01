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

public class Mytaste extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		cocDAO dao = new cocDAO();
		cocDTO dto = new cocDTO();
		List<cocDTO> list = null;
		List<cocDTO> list2 = null;
		list = dao.mypage_ct(u.getUser_id());
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder json = new StringBuilder();
        int rum = 0;
        int jin = 0;
        int dkra = 0;
        int bdca = 0;
        int brandy = 0;
        int wisky = 0;
        int other = 0;
        
        int hight = 0;
        int middle = 0;
        int row = 0;
        String atype = "";
        String btype = "";
        for (int i = 0; i < list.size(); i++) {
            cocDTO coctail = list.get(i);
          
            if(coctail.getCt_type().contains("위스키")) {
            	wisky+=1;
            }else if(coctail.getCt_type().contains("럼")) {
            	rum+=1;
            }else if(coctail.getCt_type().contains("진")) {
            	jin+=1;
            }else if(coctail.getCt_type().contains("데킬라")) {
            	dkra+=1;
            }else if(coctail.getCt_type().contains("보드카")) {
            	bdca+=1;
            }else if(coctail.getCt_type().contains("브랜디")) {
            	brandy+=1;
            }else if(coctail.getCt_type().contains("기타")) {
            	other+=1;
            }
            if(coctail.getCt_percent().length()==6) {
            	int a = Integer.parseInt(coctail.getCt_percent().substring(0,2));
            	if (a>20) {
            		hight+=1;
            	}else if(20>a && a>10) {
            		middle+=1;
            	}else if(10>a) {
            		row+=1;
            	}
            	
            }else {
            	int a = Integer.parseInt(coctail.getCt_percent().substring(0,1));
            	if (a>20) {
            		hight+=1;
            	}else if(20>a && a>10) {
            		middle+=1;
            	}else if(10>a) {
            		row+=1;
            	}
            }
           
            }
        if(rum>jin && rum>dkra && rum>bdca && rum>brandy && rum>wisky && rum>other) {
        	atype = "럼";
        } else if(jin>rum && jin>dkra && jin>bdca && jin>brandy && jin>wisky && jin>other) {
        	atype = "진";
        } else if(dkra>rum && dkra>jin && dkra>bdca && dkra>brandy && dkra>wisky && dkra>other) {
        	atype="데킬라";
        } else if(bdca>rum && bdca>jin && dkra>dkra && bdca>brandy && bdca>wisky && bdca>other) {
        	atype="보드카";
        } else if(brandy>rum && brandy>jin && brandy>dkra && brandy>bdca && brandy>wisky && brandy>other) {
        	atype="브랜디";
        } else if(wisky>rum && wisky>jin && wisky>dkra && wisky>bdca && wisky>brandy && wisky>other) {
        	atype="위스키";
        } else if(other>rum && other>jin && other>dkra && other>bdca && other>brandy && other>wisky) {
        	atype="기타";
        }else {
        	atype="다양한";
        }
        if(hight>middle && hight>row) {
        	btype ="높음 (20% 이상)";
        }else if(middle>hight && middle>row) {
        	btype ="중간 (10-20%)";
        }else if (row>hight && row>middle) {
        	btype ="낮음 (0-10%)";
        }else {
        	btype="다양한";
        }
        
        
     
        list2 = dao.ct_abtype(atype, btype);
        session.setAttribute("acoltype", atype);
        session.setAttribute("acol_value", btype);
        json.append("[");
        for (int i = 0; i < list2.size(); i++) {
            cocDTO coctail2 = list2.get(i);
            json.append("{");
            json.append("\"name\":\"").append(escapeJson(coctail2.getCt_kor_name())).append("\",");
            json.append("\"ename\":\"").append(escapeJson(coctail2.getCt_eng_name())).append("\",");
            json.append("\"description\":\"").append(escapeJson(coctail2.getCt_info())).append("\",");
            json.append("\"ABV\":\"").append(escapeJson(coctail2.getCt_percent())).append("\",");
            json.append("\"ing\":\"").append(escapeJson(coctail2.getCt_ingredient())).append("\",");
            json.append("\"rsp\":\"").append(escapeJson(coctail2.getCt_recipe())).append("\",");
            json.append("\"index\":\"").append(escapeJson(Integer.toString(coctail2.getCt_idx()))).append("\",");
            json.append("\"image\":\"").append(escapeJson(coctail2.getCt_img())).append("\"");
            
            json.append("}");
            if (i < list2.size() - 1) {
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
