package com.member.db;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Tblog.memberDAO;

@WebServlet("/MemberDeleteAction")
public class MemberDeleteAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}
	protected void dohandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int member_num = Integer.parseInt(request.getParameter("member_num"));
		memberDAO mdao = new memberDAO();
		mdao.deletemember(member_num);
		
		response.sendRedirect("login/login.jsp");
	}

}
