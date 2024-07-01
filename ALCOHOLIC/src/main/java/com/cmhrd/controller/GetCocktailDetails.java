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
import com.smhrd.model.cocDTO;

public class GetCocktailDetails extends HttpServlet {
   private static final long serialVersionUID = 1L;


     protected void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
           response.setContentType("application/json");
           response.setCharacterEncoding("UTF-8");

           String ct_idxStr = request.getParameter("ct_idx");
           int ct_idx = Integer.parseInt(ct_idxStr); // 문자열을 정수형으로 변환

           cocDAO dao = new cocDAO();
           List<cocDTO> cocktailList = dao.getCocktailDetails(ct_idx);

           JSONObject jsonResponse = new JSONObject();

           if (cocktailList != null && !cocktailList.isEmpty()) {
               JSONArray cocktailsArray = new JSONArray();
               for (cocDTO cocktail : cocktailList) {
                   JSONObject jsonCocktail = new JSONObject();
                   jsonCocktail.put("ct_idx", cocktail.getCt_idx());
                   jsonCocktail.put("ct_eng_name", cocktail.getCt_eng_name());
                   jsonCocktail.put("ct_kor_name", cocktail.getCt_kor_name());
                   jsonCocktail.put("ct_recipe", cocktail.getCt_recipe());
                   jsonCocktail.put("ct_ingredient", cocktail.getCt_ingredient());
                   jsonCocktail.put("ct_type", cocktail.getCt_type());
                   jsonCocktail.put("ct_garnish", cocktail.getCt_garnish());
                   jsonCocktail.put("ct_info", cocktail.getCt_info());
                   jsonCocktail.put("ct_percent", cocktail.getCt_percent());
                   jsonCocktail.put("ct_img", cocktail.getCt_img());
                   cocktailsArray.put(jsonCocktail);
               }
               jsonResponse.put("cocktails", cocktailsArray);
           } else {
               jsonResponse.put("error", "No cocktail found with ct_idx: " + ct_idx);
           }

           PrintWriter out = response.getWriter();
           out.print(jsonResponse.toString());
           out.flush();
       }
   }