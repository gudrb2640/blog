package com.board.action;

import java.io.IOException;
import java.util.List;

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
import com.Tblog.subheadingDTO;

@WebServlet("/WriteController.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		List<subheadingDTO> sdto = mdao.getSubheading(member_num);
		String command=request.getParameter("command");
		String address= null;
		boardDAO bdao = new boardDAO();
		
		if(command.equals("insert")) {
			request.setAttribute("sdto", sdto);
			address = "write/write.jsp";
		}else if(command.equals("update")) {
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			boardDTO bdto = bdao.getBoardInfo(board_num);
			request.setAttribute("bdto", bdto);
			request.setAttribute("sdto", sdto);
			address = "/write/writeUpdate.jsp";
			
			
		}else if(command.equals("delete")) {
			address = "BoardController.do?i=0";
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			bdao.deleteBoard(board_num);
		}
		RequestDispatcher dis = request.getRequestDispatcher(address);
		dis.forward(request, response);
	}

}
