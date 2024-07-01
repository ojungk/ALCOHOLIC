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
import com.smhrd.model.usercocDTO;

public class GetFeed extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
        cocDAO dao = new cocDAO();
        usercocDTO dto = new usercocDTO();
        usercocDTO list = null;
        list = dao.getFeed(idx);
        userDTO a = dao.usr_img_get(list.getUser_id());
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("gettitle", list.getUser_cocktail_title());
        jsonObject.put("getat", list.getUser_cocktail_at());
        jsonObject.put("geting", list.getUser_cocktail_ing());
        jsonObject.put("getrsp", list.getUser_cocktail_rsp());
        jsonObject.put("getproimg", a.getUser_img());
        jsonObject.put("getimg", list.getUser_cocktail_img());
        jsonObject.put("getuid", list.getUser_id());
        jsonObject.put("getcont", list.getUser_cocktail_content());
        jsonObject.put("uid", u.getUser_id());
        
        jsonArray.put(jsonObject);

        out.print(jsonArray.toString());
        out.flush();
	}

}
