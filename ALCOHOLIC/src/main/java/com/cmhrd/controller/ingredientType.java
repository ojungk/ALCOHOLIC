package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.cocDAO;
import com.smhrd.model.ingredientDTO;

public class ingredientType extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String type = request.getParameter("type");
        cocDAO dao = new cocDAO();
        System.out.println("받아온타입값은" + type);
        List<ingredientDTO> list = null;
        if (type.equals("null")) {
            System.out.println("1번이시작");
            list = dao.ingall();
        } else {
            System.out.println("2번이시작");
            list = dao.ingtype(type);
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
       

        StringBuilder json = new StringBuilder();
        json.append("[");
        for (int i = 0; i < list.size(); i++) {
            ingredientDTO ingredient = list.get(i);
            json.append("{");
            json.append("\"name\":\"").append(escapeJson(ingredient.getIngre_name())).append("\",");
            json.append("\"ename\":\"").append(escapeJson(ingredient.getIngre_e_name())).append("\",");
            json.append("\"description\":\"").append(escapeJson(ingredient.getIngre_info())).append("\",");
            json.append("\"type\":\"").append(escapeJson(ingredient.getIngre_type())).append("\",");
            json.append("\"index\":\"").append(escapeJson(Integer.toString(ingredient.getIngre_idx()))).append("\",");
            json.append("\"img\":\"").append(escapeJson(ingredient.getIngre_img())).append("\"");
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
