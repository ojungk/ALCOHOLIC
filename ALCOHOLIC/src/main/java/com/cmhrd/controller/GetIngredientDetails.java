package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.cocDAO;
import com.smhrd.model.ingredientDTO;

public class GetIngredientDetails extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
       response.setContentType("application/json");
           response.setCharacterEncoding("UTF-8");

           String ingre_idxStr = request.getParameter("ingre_idx");
           int ingre_idx = Integer.parseInt(ingre_idxStr); // 문자열을 정수형으로 변환

           cocDAO dao = new cocDAO();
           List<ingredientDTO> ingreList = dao.getIngredients(ingre_idx);

           JSONObject jsonResponse = new JSONObject();

           if (ingreList != null && !ingreList.isEmpty()) {
               JSONArray ingresArray = new JSONArray();
               for (ingredientDTO ingre : ingreList) {
                   JSONObject jsonIngre = new JSONObject();
                   jsonIngre.put("ingre_idx", ingre.getIngre_idx());
                   jsonIngre.put("ingre_name", ingre.getIngre_name());
                   jsonIngre.put("ingre_e_name", ingre.getIngre_e_name());
                   jsonIngre.put("ingre_type", ingre.getIngre_type());
                   jsonIngre.put("ingre_info", ingre.getIngre_info());
                   jsonIngre.put("ingre_img", ingre.getIngre_img());
                   ingresArray.put(jsonIngre);
               }
               jsonResponse.put("ingres", ingresArray);
           } else {
               jsonResponse.put("error", "No ingre found with ingre_idx: " + ingre_idx);
           }

           PrintWriter out = response.getWriter();
           out.print(jsonResponse.toString());
           out.flush();
       }

}
