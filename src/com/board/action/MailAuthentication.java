package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/MailAuthentication")
public class MailAuthentication extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dohandle(request, response);
	}
	protected void dohandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String title ="T-Blog에서 보낸 인증 번호입니다.";
		int num = (int)( (Math.random())*1000000);
		String text = Integer.toString(num);
		if(text.length()==5) {
			text = "0"+text;
		}
		Mail mail = new Mail();
		mail.naverMailSend(title, text, address);
		out.print(text);
	}
}
