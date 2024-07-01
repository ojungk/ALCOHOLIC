package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;

public class getimg extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        userDTO u = (userDTO) session.getAttribute("UserInfo");
        
        if (u == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in.");
            return;
        }
        
        String id = u.getUser_id();
        cocDAO dao = new cocDAO();
        userDTO dto = new userDTO();
        dto.setUser_id(id);
        userDTO list = dao.getid(dto);
        
        if (list == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
            return;
        }
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("getid", list.getUser_id());
        jsonObject.put("getimg", list.getUser_img());
        jsonArray.put(jsonObject);

        out.print(jsonArray.toString());
        out.flush();
    }
}

