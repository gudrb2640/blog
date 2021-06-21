package com.board.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

import com.Tblog.memberDAO;
import com.Tblog.memberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/ImageUploadController.do")
public class ImageUploadController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		String directory = getServletContext().getRealPath("/upload_images/");
		int maxSize = 10*1024*1024;
		
		MultipartRequest multipartRequest;
		
		multipartRequest = new MultipartRequest(request,directory,maxSize,new DefaultFileRenamePolicy());

		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		memberDAO mdao = new memberDAO();
		memberDTO mdto = mdao.getmemberInfo(id);
		int member_num = mdto.getMember_num();
		String main_img = multipartRequest.getFilesystemName("image");
		mdao.updateImg(member_num,main_img );
		
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardController.do?i=0");
		dis.forward(request, response);
	}

}
