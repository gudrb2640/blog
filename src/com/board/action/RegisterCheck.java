package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Tblog.memberDAO;

@WebServlet("/RegisterCheck")
public class RegisterCheck extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		String param = null;
		int check = 0;
		memberDAO mdao = new  memberDAO();
		if(command.equals("id")) {
			param = request.getParameter("param");
			check = mdao.idCheck(param);
			if(check == 0) {
				out.print("사용가능한 아이디입니다.");
			}else if(check == 1){
				out.print("중복된 아이디입니다.");
			}
		}else if(command.equals("blog_name")) {
			param = request.getParameter("param");
			check = mdao.blog_nameCheck(param);
			if(check == 0) {
				out.print("사용가능한 이름입니다.");
			}else if(check == 1){
				out.print("이미 존재하는 블로그 이름입니다.");
			}
		}else if(command.equals("email")){
			param = request.getParameter("param");
			check = mdao.emailCheck(param);
			if(check == 0) {
				out.print("사용가능한 이메일입니다.");
			}else if(check == 1){
				out.print("다른 계정에서 사용하고 있는 메일입니다.");
			}
		}else if(command.equals("phone")){
			param = request.getParameter("param");
			check = mdao.phoneCheck(param);
			if(check == 0) {
				out.print("사용가능한 번호입니다.");
			}else if(check == 1){
				out.print("다른 계정에서 사용하고 있는 번호입니다.");
			}
		}
		
		
	}
}
