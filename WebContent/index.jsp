<%@page import="com.Tblog.subheadingDTO"%>
<%@page import="com.Tblog.membersCategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/javascript.js"></script>


<%
request.setCharacterEncoding("utf-8");
%>
<link rel="stylesheet" href="css/style.css">
<style>
	.header {
	height: 350px;
	background-image: url('upload_images/${mdto.main_img}');
	background-color: grey;
	background-repeat: no-repeat;
	background-size: 100% 350px;
}

a:link {
  color : black;
  text-decoration: none;
}
a:visited {
  color : black;
  text-decoration: none;
}
a:hover {
  color : black;
  text-decoration: none;
}
a:active {
  color : black;
  text-decoration: none;
}

</style>

<title>${mdto.blog_name }</title>
<c:set var="center" value="${center }"/>
</head>
<body style="overflow:hidden;">
	<header>
		<jsp:include page="header.jsp"/>
	</header>
		<div class="container-fluid">
			<div class="row list">
				<div class="col-md-2" style="border: 0px solid; border-right-width:3px; ">
					<jsp:include page="side_L.jsp"/>
				</div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<jsp:include page="${center }"/>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp"/>
		</div>
</body>
</html>