package com.member.db;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Tblog.memberDAO;

@WebServlet("/memberUpdateAction.do")
public class memberUpdateAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String command = request.getParameter("command");
		int member_num	= Integer.parseInt(request.getParameter("member_num"));
		PrintWriter out = response.getWriter();
		memberDAO mdao = new memberDAO();
		String param = null;
		int check =0;
		if(command.equals("id")) {
			String id = request.getParameter("id");
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("id2", id);
			mdao.updateID(id, member_num);
		}else if(command.equals("pw")) {
			String new_pw = request.getParameter("new_pw");
			mdao.updatePw(new_pw, member_num);
		}else if(command.equals("name")) {
			String name = request.getParameter("name");
			mdao.updateName(name, member_num);
		}else if(command.equals("phone")) {
			String phone = request.getParameter("phone");
			mdao.updatePhone(phone, member_num);
		}else if(command.equals("email")){
			String email = request.getParameter("email");
			mdao.updateEmail(email, member_num);
		}
		
		response.sendRedirect("BoardController.do?center=MemberUpdate.jsp");
	}

}
