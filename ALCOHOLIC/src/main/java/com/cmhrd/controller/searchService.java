package com.cmhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.cocDAO;
import com.smhrd.model.cocDTO;
import com.smhrd.model.ingredientDTO;

public class searchService extends HttpServlet {
   private static final long serialVersionUID = 1L;
      
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
           String query = request.getParameter("query");
           System.out.println(query);
         // 데이터베이스에서 검색
              cocDAO cocDAO = new cocDAO();
              List<cocDTO> cocktailResults = cocDAO.searchCocktails(query);
              List<ingredientDTO> ingredientResults = cocDAO.searchIngredients(query);
             
              // JSON 응답 생성
              JSONObject jsonResponse = new JSONObject();
              JSONArray cocktails = new JSONArray();
              JSONArray ingredients = new JSONArray();

              // 칵테일 결과 처리
              if (cocktailResults != null) { // cocktailResults가 null이 아닌 경우에만 처리
              for (cocDTO cocktail : cocktailResults) {
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
                  cocktails.put(jsonCocktail);
                  System.out.println(jsonCocktail);
                 }
              }else {
                 System.out.println("검색결과가 없습니다.");
              }
              
              // 재료 결과 처리
              if (ingredientResults != null) { // cocktailResults가 null이 아닌 경우에만 처리
              for (ingredientDTO ingredient : ingredientResults) {
                  JSONObject jsonIngredient = new JSONObject();
                  jsonIngredient.put("ingre_idx", ingredient.getIngre_idx());
                  jsonIngredient.put("ingre_name", ingredient.getIngre_name());
                  jsonIngredient.put("ingre_e_name", ingredient.getIngre_e_name());
                  jsonIngredient.put("ingre_type", ingredient.getIngre_type());
                  jsonIngredient.put("ingre_info", ingredient.getIngre_info());
                  jsonIngredient.put("ingre_img", ingredient.getIngre_img());
                  ingredients.put(jsonIngredient);
                 }
              }else {
                 System.out.println("검색결과가 없습니다.");
              }
              // 결과 존재 여부 확인 및 JSON 응답 생성
              boolean resultsExist = !cocktailResults.isEmpty() || !ingredientResults.isEmpty();
              jsonResponse.put("resultsExist", resultsExist);
              jsonResponse.put("cocktails", cocktails);
              jsonResponse.put("ingredients", ingredients);
              
              // 클라이언트에 JSON 응답 전송
              response.setContentType("application/json");
              response.setCharacterEncoding("UTF-8");
              response.getWriter().write(jsonResponse.toString());
              
              HttpSession session = request.getSession();
              session.setAttribute("cocktailResults", cocktailResults); // 칵테일 검색 결과 저장
              session.setAttribute("ingredientResults", ingredientResults); // 재료 검색 결과 저장
              session.setAttribute("searchQuery", query); // 검색어 저장         
         
      }
   

   

}
