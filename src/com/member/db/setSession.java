package com.member.db;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Tblog.memberDAO;
import com.Tblog.memberDTO;

@WebServlet("/setSession.do")
public class setSession extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String id2 = request.getParameter("id2");
		session.setAttribute("id", id);
		if(id.equals(id2)){
			session.setAttribute("id2", id2);
		}
		response.sendRedirect("BoardController.do?i=0");
	}

}
