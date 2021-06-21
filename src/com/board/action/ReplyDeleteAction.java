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
@WebServlet("/ReplyDeleteAction.do")
public class ReplyDeleteAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		int i =Integer.parseInt(request.getParameter("i"));
		boardDAO bdao = new boardDAO();
		bdao.deleteReply(reply_num);
		response.sendRedirect("BoardController.do?i="+i);
	}

}
