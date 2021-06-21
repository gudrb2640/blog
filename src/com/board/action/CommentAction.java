package com.board.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Tblog.boardDAO;
import com.Tblog.memberDAO;
@WebServlet("/CommentAction.do")
public class CommentAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id2");
		String comment = request.getParameter("comment");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pos = Integer.parseInt(request.getParameter("pos"));
		int i =Integer.parseInt(request.getParameter("i"));
		int count = Integer.parseInt(request.getParameter("count"));
		boardDAO bdao = new boardDAO();
		bdao.insertComment(board_num, id, comment, pos,count);
		response.sendRedirect("BoardController.do?i="+i);
	}

}
