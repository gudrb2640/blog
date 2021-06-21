package com.board.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Tblog.boardDAO;

@WebServlet("/WriteUpdateAction.do")
public class WriteUpdateAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int subheading_num = Integer.parseInt(request.getParameter("subheading_num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		boardDAO bdao = new boardDAO();
		bdao.updateBoard(title, content, subheading_num, board_num);
		
		response.sendRedirect("BoardController.do?i=0");
		
	}

}
