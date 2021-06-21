<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<style type="text/css">
@charset "EUC-KR";

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	background-color: #FAFAFA;
	font: 12pt "Tahoma";
}

* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.page {
	width: 210mm;
	min-height: 297mm;
	padding: 20mm;
	margin: 10mm auto;
	border: 1px #D3D3D3 solid;
	border-radius: 5px;
	background: white;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

@page {
	size: A4;
	margin: 0;
}

@media print {
	html, body {
		width: 210mm;
		height: 297mm;
	}
	.page {
		margin: 0;
		border: initial;
		border-radius: initial;
		width: initial;
		min-height: initial;
		box-shadow: initial;
		background: initial;
		page-break-after: always;
	}
}

.title {
	background-color: transparent;
	outline: none;
	border: none;
	width: 700px;
	font-size: 35px;
}

.content {
	border: none;
	outline: none;
}


.optionbox select {
    background: #28a745;
    color: #fff;
    padding: 11px;
    width: 130px;
    height: 38x;
    border: none;
    font-size: 13px;
    outline: none;
    border-radius: 5px;
}

.category{
	font-style: oblique;
	color: black;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".btn-success").click(function(){
			var subheading_num = $("#subheading_num").val();
			var title = $("#title").val();
			var content = $("#content").val();
			if(title =="" || title == " "){
				alert("제목을 입력해 주세요");
				title = "";
			}else if(content == "" || content == " "){
				alert("내용을 입력해 주세요");
				content = "";
			}else if(subheading_num == 0){
				alert("카테고리를 제대로 선택해 주세요");
			}else{
				$("#form").submit();
			}
		});		
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>글쓰기</title>
</head>
<body>
	<form action="WriteUpdateAction.do" method="post" id="form">
		<div class="book">
			<div class="row" >
				<div class="optionbox col-md-12" align="right">
					<select name="subheading_num" id="subheading_num">
						<option value="0">---카테고리---</option>
						<option class="category" value="0">-----${sdto[0].category } -----</option>
						<c:forEach var="i" begin="0" step="1" end="${sdto.size() }" >
							<option value="${sdto[i].subheading_num }">${sdto[i].subheading }</option>
						<c:if test="${sdto[i].category ne sdto[i+1].category && !empty sdto[i+1]}">
							<option class="category" value="0">-----<em>${sdto[i+1].category}</em>-----</option>
						</c:if>
						</c:forEach>
					</select>
					<input type="button" class="btn btn-success" value="발행" />
				</div>
			</div>
			<div class="page">
				<input type="text" id="title" name="title" class="title" placeholder="제목" value="${bdto.title }"  required="required"/><br>
				<hr>
				<textarea rows="100%" id="#content" cols="80" name="content" class="content"
					placeholder="태그는 사용 불가능합니다." required="required">${bdto.content }</textarea>
			</div>
			<input type="hidden" value="${bdto.board_num }" name="board_num"/>
		</div>
	</form>
</body>
</html>