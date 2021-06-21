<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
%>

<body>
	<form action="ImageUploadController.do?id=${mdto.id }" method="post"
			enctype="multipart/form-data">
			<div class="header" align="right" >
			<c:if test="${id eq id2 }">
					<label for="image"><img alt="add_image"
						src="images/insert.png"></label> <input type="file" id="image"
						name="image" /> <input type="submit" class="input-file-button"
						value="이미지 변경">
			</c:if>
			</div>
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand" href="BoardController.do?i=0">${mdto.blog_name }</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
						</ul>
						<c:if test="${id eq id2  }">
						<a href="BoardController.do?center=MemberUpdate.jsp">My page</a>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${id ne id2  }">
						<a href="setSession.do?id=${id2 } ">My Blog</a>&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${id ne null}">
						<a href="login/login.jsp#tologin">Logout</a>
						</c:if>
					</div>
				</nav>
			</div>
		</div>
		<hr style="background-color:black; height: 2px">
		</form>
</body>
</html>