package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.cocDAO;
import com.smhrd.model.postDTO;
import com.smhrd.model.userDTO;

public class GetPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
        cocDAO dao = new cocDAO();
        postDTO dto = new postDTO();
        dto.setPost_idx(idx);
        postDTO list = null;
        list = dao.getpost(dto);
        
        if (list == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
            return;
        }
       
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("gettitle", list.getPost_title());
        jsonObject.put("getat", list.getCreated_at());
        jsonObject.put("getview", list.getPost_views());
        jsonObject.put("getimg", list.getPost_img());
        jsonObject.put("getuid", list.getUser_id());
        jsonObject.put("getcont", list.getPost_content());
        jsonObject.put("uid", u.getUser_id());
        
        jsonArray.put(jsonObject);

        out.print(jsonArray.toString());
        out.flush();
	}

}
