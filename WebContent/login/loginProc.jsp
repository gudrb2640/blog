<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdto" class="com.Tblog.memberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.Tblog.memberDAO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>

<%
	dao.insertMember(mdto);
	response.sendRedirect("login.jsp");
%>
