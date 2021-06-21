package com.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Tblog.boardDAO;
import com.Tblog.boardDTO;
import com.Tblog.memberDAO;
import com.Tblog.memberDTO;

@WebServlet("/WriteInsertAction.do")
public class WriteInsertAction extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		memberDAO mdao = new memberDAO();
		memberDTO mdto = mdao.getmemberInfo(id);
		int member_num = mdto.getMember_num();
		int subheading_num = Integer.parseInt(request.getParameter("subheading_num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		boardDTO bdto = new boardDTO(member_num, subheading_num, title, content,0);
		boardDAO bdao = new boardDAO();
		bdao.insertBoard(bdto);
		
		response.sendRedirect("BoardController.do?i=0");
	}
}

