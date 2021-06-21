package com.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Tblog.memberDAO;
import com.Tblog.memberDTO;

@WebServlet("/LeftSideController.do")
public class LeftSideController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		
		String type = request.getParameter("type");
		String id = (String)session.getAttribute("id");
		memberDAO mdao = new memberDAO();
		memberDTO mdto = mdao.getmemberInfo(id);
		int member_num = mdto.getMember_num();
		if(type.equals("insert")){
			String new_title= request.getParameter("new_category");
			mdao.insertCategory(member_num,new_title);
		}else if(type.equals("delete")){
			int title_num= Integer.parseInt(request.getParameter("category_num"));
			mdao.deleteCategory(title_num);
		}else if(type.equals("update")){
			int title_num= Integer.parseInt(request.getParameter("category_num"));
			String update_title= request.getParameter("update_category");
			mdao.updateCategory(update_title,title_num);
		}else if(type.equals("s_insert")){
			String new_subheading = request.getParameter("new_subheading");
			int category_num = Integer.parseInt(request.getParameter("category_num"));
			mdao.insertSubheading(member_num, category_num, new_subheading);
		}else if(type.equals("s_update")){
			int subheading_num = Integer.parseInt(request.getParameter("subheading_num"));
			String subheading = request.getParameter("subheading");
			mdao.updateSubheading(subheading_num, subheading);
		}else if(type.equals("s_delete")){
			int subheading_num = Integer.parseInt(request.getParameter("subheading_num"));
			mdao.deleteSubheading(subheading_num);
		}
		
		response.sendRedirect("BoardController.do?id="+id+"&i=0");
//		RequestDispatcher dis = request.getRequestDispatcher("BoardController.do");
//		dis.forward(request, response);
		
	}
}
