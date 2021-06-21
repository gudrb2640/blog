package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Tblog.memberDAO;

@WebServlet("/UpdateCheck")
public class UpdateCheck extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		String command = request.getParameter("command");
		PrintWriter out = response.getWriter();
		memberDAO mdao = new memberDAO();
		String param = null;
		int check =0;
		if(command.equals("id")) {
			param = request.getParameter("param");
			check = mdao.idCheck(param);
			if(check == 0 ){
				out.print("사용가능한 아이디입니다.");
			}else if(check == 1){
				out.print("중복된 아이디입니다.");
			}
		}else if(command.equals("pw")) {
			param = request.getParameter("param");
			int member_num = Integer.parseInt(request.getParameter("member_num"));
			check = mdao.pwCheck(param,member_num);
			if(check == 0 ){
				out.print("비밀번호가 일치하지 않습니다.");
			}else if(check == 1){
				out.print("비밀번호 동일");
			}
		}else if(command.equals("phone")) {
				param = request.getParameter("param");
				check = mdao.phoneCheck(param);
				if(check == 0) {
					out.print("사용가능한 번호입니다.");
				}else if(check == 1){
					out.print("다른 계정에서 사용하고 있는 번호입니다.");
				}
		}else if(command.equals("email")){
			param = request.getParameter("param");
			check = mdao.emailCheck(param);
			if(check == 0) {
				out.print("사용가능한 이메일입니다.");
			}else if(check == 1){
				out.print("다른 계정에서 사용하고 있는 메일입니다.");
			}
		}
	}
}
