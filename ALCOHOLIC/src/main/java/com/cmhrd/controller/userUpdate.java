package com.cmhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.cocDAO;
import com.smhrd.model.userDTO;

public class userUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		userDTO u = (userDTO) session.getAttribute("UserInfo");
		request.setCharacterEncoding("UTF-8");
		String nick = request.getParameter("userNick");
		String pw1 = request.getParameter("userpw1");
		String pw2 = request.getParameter("userpw2");
		userDTO dto = new userDTO();
		cocDAO dao = new cocDAO();
		int a = 0;

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
		    if (pw1.equals(pw2)) {
		        dto.setUser_id(u.getUser_id());
		        dto.setUser_nick(nick);
		        dto.setUser_pw(pw2);
		        a = dao.user_update(dto);
		    } else {
		        out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
		        out.close(); // 응답 종료
		        return; // 메서드 종료
		    }

		    if (a > 0) {
		        userDTO b = dao.login(dto);
		        session.setAttribute("UserInfo", b);
		        out.println("<script>alert('수정완료!'); window.location.href='mypage.jsp';</script>");
		        out.close(); // 응답 종료
		    } else {
		        out.println("<script>alert('수정에 실패했습니다. 다시 시도해 주세요.'); history.go(-1);</script>");
		        out.close(); // 응답 종료
		    }
		} catch (Exception e) {
		    e.printStackTrace(); // 콘솔에 예외 출력
		    out.println("<script>alert('서버 오류가 발생했습니다. 다시 시도해 주세요.'); history.go(-1);</script>");
		    out.close(); // 응답 종료
		}
	}

}
