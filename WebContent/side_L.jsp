<%@page import="com.Tblog.subheadingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Tblog.membersCategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<form method="post" id="index">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h3>
					Category
					<c:if test="${id eq id2 }">
						<a href="#" id="insert_category"> <img alt="추가"
							src="images/insert.png">
						</a>
					</c:if>
				</h3>
				<input type="text" id="new_category" name="new_category"
					placeholder="카테고리 제목" hidden> <a href="#"
					id="insert_category2" hidden> <img alt="추가"
					src="images/insert.png">
				</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<a href="BoardController.do?i=0"><font size="2">전체 글
						보기(${totalRecord })</font></a>
			</div>
			<c:if test="${id eq id2 }">
				<div class="col-md-4">
					<a href="WriteController.do?command=insert"><font size="2">글쓰기</font></a>
				</div>
			</c:if>
		</div>

		<div class="row">
			<c:forEach var="c" items="${category_v }">
				<div class="col-md-9 col-md-offset-2">
					<h5>
						<a class="Sub_nav"> <input type="text" class="title"
							name="update_category" value="${c.category }" required="required"
							disabled> <input type="hidden" id="category_num"
							value="${c.category_num }">
						</a>
						<c:if test="${id eq id2 }">
							<a href="#" class="a"><img alt="추가" src="images/insert.png"
								hidden></a>
							<a href="#" class="update_category"><img alt="수정"
								src="images/update.png"></a>
							<a href="#" class="delete_category"><img alt="삭제"
								src="images/trash.png"></a>
						</c:if>
					</h5>
					<input type="text" class="new_subheading" id="new_subheading"
						name="new_subheading" placeholder="목록 추가" maxlength="15" hidden>
					<a href="#" class="insert_subheading2" id="insert_subheading2"
						hidden> <svg xmlns="http://www.w3.org/2000/svg" width="16"
							height="16" fill="currentColor" class="bi bi-plus"
							viewBox="0 0 16 16">
				<path
								d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
			</svg>
					</a>
					<ul style="list-style: disc;">
						<c:forEach var="s" items="${subheading_v }">
							<c:if test="${c.category eq s.category }">

								<li><a
									href="BoardController.do?command=select&i=0&subheading_num=${s.subheading_num}"
									class="show_subheading">${s.subheading } <c:forEach
											var="size" items="${subheadingSize_v }">
											<c:if test="${s.subheading_num == size.subheading_num }">
							(${size.count })
						</c:if>
										</c:forEach>
								</a> <input class="subheading" name="subheading" type="text"
									value="${s.subheading }" hidden disabled> <a href="#"
									class="update_subheading2" hidden> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
							<path
												d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
						</svg>
								</a> <input type="hidden" class="subheading_num"
									value="${s.subheading_num }" /> <c:if test="${id eq id2 }">
										<div class="dropdown" style="float: right;">
											<a href="#" data-toggle="dropdown"> <svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-dot" viewBox="0 0 16 16">
							<path d="M8 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
						</svg>
											</a>
											<div class="dropdown-menu dropdown-menu-location">
												<a class="dropdown-item update_subheading" href="#">수정</a> <a
													class="dropdown-item delete_subheading" href="#">삭제</a>
											</div>
										</div>
									</c:if></li>
							</c:if>
						</c:forEach>
						<c:if test="${id eq id2 }">
							<div class="col-md-2 col-md-offset-10">
								<a href="#" class="insert_subheading"> <svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
						<path
											d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
					</svg>
								</a>
							</div>
						</c:if>
					</ul>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<div class="col-md-12" align="center">
				<hr>
				<div class="row">
					<div class="col-md-12" align="center">
						<font>추천 블로그</font>
					</div>
				</div>
				<div class="row">
					<c:set var="loop" value="true" />
					<c:forEach var="mv" items="${member_v }">
						<c:if test="${loop }">
							<c:if test="${!(id2 eq mv.id || id eq mv.id) }">
								<div
									style="width: 70px; height: 100px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; margin-left: 28px">
									<div>
										<img alt="" src="upload_images/${mv.main_img }"
											style="width: 100%; height: 50px; background-color: grey;" />
									</div>
									<a href="setSession.do?id=${mv.id }"> <font>${mv.blog_name }</font>
									</a>
									<c:set var="count" value="${count +1 }" />
								</div>
							</c:if>
							<c:if test="${count == 3 }">
								<c:set var="loop" value="false" />
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</form>
</body>
</html>