package com.board.action;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.Tblog.boardDAO;
import com.Tblog.boardDTO;
import com.Tblog.boardInfoDTO;
import com.Tblog.memberDAO;
import com.Tblog.memberDTO;
import com.Tblog.membersCategoryDTO;
import com.Tblog.replyDTO;
import com.Tblog.subheadingDTO;
import com.Tblog.subheadingSizeDTO;

@WebServlet("/BoardController.do") 
public class BoardController extends HttpServlet {
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
		
		String center = request.getParameter("center");
		String command = request.getParameter("command");
		memberDAO mdao = new memberDAO();
		memberDTO mdto = mdao.getmemberInfo(id);
		int member_num = mdto.getMember_num();
		int i =0;
		String paging =request.getParameter("paging");
		boardDAO bdao = new boardDAO();
		Vector<boardInfoDTO> v = bdao.getBoardList(member_num);
		int totalRecord = v.size();
		Vector<subheadingSizeDTO> subheadingSize_v = bdao.getSubheadingSize();
		Vector<membersCategoryDTO> category_v = mdao.getCategory(member_num);
		Vector<subheadingDTO> subheading_v = mdao.getSubheading(member_num);
		Vector<memberDTO> member_v = mdao.getMemberList();
		Vector<replyDTO> reply_v = bdao.getReplyList();
		for(int x=0;x<member_v.size();x++){
			int j = (int)(Math.round(Math.random()*(member_v.size()-1)));
			int k = (int)(Math.round(Math.random()*(member_v.size()-1)));
			
			memberDTO tmp = member_v.get(j);
			member_v.set(j,member_v.get(k));
			member_v.set(k, tmp);
		}
		
		int nowPage=0;	
		int nowBlock =0;	
		int beginPerPage=0;   
		
	
		if(center == null) {
			center = "board.jsp";
			i = Integer.parseInt(request.getParameter("i"));
		}
		
		if(command == null) {
			command = "all";
		}else if(command.equals("select")) {
			int subheading_num = Integer.parseInt(request.getParameter("subheading_num"));
			v = bdao.getSelectBoardList(subheading_num);
		}else {
			command = "all";
		}
		
		if(paging != null) {
			nowPage = Integer.parseInt((request.getParameter("nowPage")));
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
			
		}
		
		request.setAttribute("member_v", member_v);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("nowBlock", nowBlock);
		request.setAttribute("i", i);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("subheading_v", subheading_v);
		request.setAttribute("category_v", category_v);
		request.setAttribute("subheadingSize_v",subheadingSize_v);
		request.setAttribute("board_type",command);
		request.setAttribute("mdto", mdto);
		request.setAttribute("v", v);
		request.setAttribute("center", center);
		request.setAttribute("reply_v", reply_v);
		
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}

}
