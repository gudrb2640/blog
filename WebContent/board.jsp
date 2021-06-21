<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.page {
	width: 300mm;
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

table {
	border-top: 1px solid #F6F6F6;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #F6F6F6;
}

.comment, .cancle {
	cursor: pointer;
}

.offset3 {
	margin-left: 20%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script type="text/javascript">
	$(function() {
		$(".reply_btn1").click(function() {
			$(this).attr("hidden", true);
			$(".reply_btn2").removeAttr("hidden");
			$(".reply_desc").removeAttr("hidden");
		});
		$(".reply_btn2").click(function() {
			$(this).attr("hidden", true);
			$(".reply_btn1").removeAttr("hidden");
			$(".reply_desc").attr("hidden", true);
		});
		$(".comment").click(function() {
			$(this).parent().parent().next().removeAttr("hidden");
		});
		$(".cancle").click(function() {
			$(this).parent().parent().attr("hidden", true);
		});
	});
</script>
</head>
<body>

	<c:set var="i" value="${i }" />
	<c:set var="totalRecord" value="${v.size()}" />
	<c:set var="numPerPage" value="3" />
	<c:set var="pagePerBlock" value="3" />
	<c:set var="totalPage" value="${totalRecord/numPerPage  }" />
	<c:set var="totalPage" value="${totalPage+(1-(totalPage%1))%1 }" />
	<c:set var="totalBlock" value="${totalPage/pagePerBlock }" />
	<c:set var="totalBlock" value="${totalBlock+(1-(totalBlock%1))%1 }" />
	<c:set var="nowPage" value="${nowPage }" />
	<c:set var="nowBlock" value="${nowBlock }" />
	<c:set var="beginPerPage" value="${nowPage*numPerPage }" />
	<c:choose>
		<c:when test="${empty v}">
			<h2>작성한 글이 없습니다.</h2>
			<c:if test="${id eq id2 }">
				<br>
				<h4>
					<a href="WriteController.do?command=insert">글 작성하러 가기 </a>
					<h4>
			</c:if>
		</c:when>
		<c:otherwise>
			<h2>${v[i].subheading}</h2>
			<div class="book">
				<div class="page">
					<div class="row" align="left">
						<div class="col-md-9" align="left">
							<font size="6">${v[i].title }</font>
						</div>
						<div>
							<div>
								<fmt:formatDate value="${v[i].date }" type="date"
									dateStyle="long" pattern="yyyy.MM.dd(E)" />
								<br>
							</div>
						</div>
					</div>
					<hr>
					<div style="white-space: pre-wrap;"><c:out value="${v[i].content }" />
					</div>
					<br>
				</div>
				<div class="row">
					<div class="col-md-2 col-md-offset-2">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
						<path
							d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
						<path
							d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
						</svg>
						댓글
						<c:set var="reply_count" value="0"/>
							<c:forEach var="rv" items="${reply_v }">
								<c:if test="${rv.board_num == v[i].board_num }">
									<c:set var="reply_count" value="${reply_count+1 }"/>
								</c:if>
							</c:forEach>
							<c:if test="${reply_count != 0 }">
								(${reply_count })
							</c:if>
						<button type="button" class="reply_btn1"
							style="background-color: white; border: none;">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-caret-down-square"
								viewBox="0 0 16 16"> <path
								d="M3.626 6.832A.5.5 0 0 1 4 6h8a.5.5 0 0 1 .374.832l-4 4.5a.5.5 0 0 1-.748 0l-4-4.5z" />
							<path
								d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 0a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2z" />
							</svg>
						</button>
						<button type="button" class="reply_btn2"
							style="background-color: white; border: none;" hidden>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-caret-up-square"
								viewBox="0 0 16 16"> <path
								d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
							<path
								d="M3.544 10.705A.5.5 0 0 0 4 11h8a.5.5 0 0 0 .374-.832l-4-4.5a.5.5 0 0 0-.748 0l-4 4.5a.5.5 0 0 0-.082.537z" />
							</svg>
						</button>
					</div>
					<c:if test="${id eq id2 }">
					<div class="col-md-6" align="right">
						<button name="upadate_board" type="button"
							class="btn btn-outline-info"
							onclick="location.href='WriteController.do?command=update&board_num=${v[i].board_num}'" />
						수정
						<button name="delete_board" type="button"
							class="btn btn-outline-info"
							onclick="location.href='WriteController.do?command=delete&board_num=${v[i].board_num}'" />
						삭제
					</div>
					</c:if>
				</div>
				<div class="row">
					<div class="col-md-5 col-md-offset-2">
						<div class="reply_desc" hidden>
							<c:forEach var="rv" items="${reply_v }">
								<c:if test="${rv.depth==1 }">
									<c:set var="col" value="col-md-10 col-md-offset-1" />
								</c:if>
								<c:if test="${rv.depth==0 }">
									<c:set var="col" value="col-md-12" />
								</c:if>
								<c:if test="${v[i].board_num == rv.board_num }">
									<div class="row">
										<div class="${col }">
											<div class="row">
												<c:if test="${rv.depth==1 }">
													<svg xmlns="http://www.w3.org/2000/svg" width="16"
														height="16" fill="currentColor"
														class="bi bi-arrow-return-right" viewBox="0 0 16 16">
													<path fill-rule="evenodd"
														d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z" />
													</svg>
												</c:if>
												<font size="1" style="font-weight: bold;">${rv.id } (<fmt:formatDate
														value="${rv.date }" dateStyle="medium" pattern="yy.MM.dd" />
													<fmt:formatDate value="${rv.date }" type="time"
														pattern="HH:mm:ss" />)
												</font>
											</div>
											<div class="row">
												<div class="col-md-12"
													style="white-space: pre-wrap; word-wrap: break-word;">${rv.content}
												</div>
											</div>
											<div class="row">
												<div class="col-md-12" align="right">
													<c:if test="${rv.depth==0 }">
														<a class="comment"> <font size="1">답글</font></a>
													</c:if>
													<c:if test="${id eq id2 || rv.id eq id2 }">
														<a
															href="ReplyDeleteAction.do?i=${i }&reply_num=${rv.reply_num}">
															<font size="1">삭제</font>
														</a>
													</c:if>
												</div>
											</div>

											<div class="row" hidden>
												<form method="post" action="CommentAction.do">
													<div class="col-md-12">
														<textarea name="comment" rows="3" cols="70"></textarea>
														<button type="submit" style="background-color: white; border: none; font-size:4px">등록</button>
														</a> <a class="cancle"> <font size="1">취소</font>
														</a>
													</div>
													<input type="hidden" name="board_num" value="${v[i].board_num }"> 
													<input type="hidden" name="i" value="${i }">
													<input type="hidden" name="pos" value="${rv.pos }">
													<input type="hidden" name="count" value="${rv.count }">
												</form>
											</div>
										</div>
									</div>
									<hr>
								</c:if>
							</c:forEach>
							<div class="row">
								<div class="col-md-12">
									<font size="1"><b>${id2 }</b></font>
								</div>
							</div>
							<form method="post" action="ReplyAction.do">
								<div class="row">
									<div class="col-md-12">
										<textarea name="content" rows="3" cols="70"
											placeholder="1000자까지 작성 가능"></textarea>
										<button type="submit" id="insert_reply_btn"
											class="btn btn-outline-info" style="margin-bottom: 33px">등록</button>
									</div>
								</div>
								<input type="hidden" name="board_num" value="${v[i].board_num }">
								<input type="hidden" name="i" value="${i }">
							</form>
						</div>
					</div>
				</div>
			</div>
			<div align="center">
				<div>
					<table border=0 width=50% cellpadding=2 cellspacing=0>
						<tr align=center bgcolor=#F6F6F6 height=120%>
							<td align="left">글 제목</td>
							<td>날짜</td>
						</tr>
						<c:set var="loop" value="true" />

						<c:forEach var="j" begin="${beginPerPage }" step="1"
							end="${beginPerPage+numPerPage-1 }">
							<c:if test="${loop }">
								<c:if test="${j == totalRecord-1 }">
									<c:set var="loop" value="false" />
								</c:if>
								<tr align="center">
									<td align="left"><a
										href="BoardController.do?command=${board_type }&subheading_num=${v[j].subheading_num}&paging=true&i=${j }&nowPage=${nowPage }&nowBlock=${nowBlock }">${v[j].title }
										<c:set var="reply_count" value="0"/>
										<c:forEach var="rv" items="${reply_v }">
											<c:if test="${rv.board_num == v[j].board_num }">
												<c:set var="reply_count" value="${reply_count+1 }"/>
											</c:if>
										</c:forEach>
										<c:if test="${reply_count != 0 }">
											(${reply_count })
										</c:if>
										</a></td>
									<td><fmt:formatDate value="${v[j].date }"
											dateStyle="medium" /></td>
								</tr>
							</c:if>
						</c:forEach>
						<tr>
							<td align="center" colspan="2"><c:if
									test="${totalBlock > 0 }">
									<c:if test="${nowBlock > 0 }">
										<a
											href="BoardController.do?command=${board_type }&subheading_num=${v[j].subheading_num}&i=${i }&paging=true&nowBlock=${nowBlock-1 }&nowPage=${(nowBlock-1)*pagePerBlock}">
											이전◀◀ </a>
									</c:if>
								</c:if> <c:set var="loop" value="true" /> <c:forEach var="j" begin="0"
									end="${pagePerBlock-1 }" step="1">
									<c:if test="${loop }">
										<c:if test="${(nowBlock*pagePerBlock)+j == totalPage -1 }">
											<c:set var="loop" value="false" />
										</c:if>
										<a
											href="BoardController.do?command=${board_type }&subheading_num=${v[j].subheading_num}&i=${i }&paging=true&nowBlock=${nowBlock }&nowPage=${(nowBlock*pagePerBlock)+j}">
											${(nowBlock*pagePerBlock)+1+j } </a>
										<c:if test="${(nowBlock*pagePerBlock)+1+j == totalRecord }">
											<c:set var="loop" value="false" />
										</c:if>
									</c:if>
								</c:forEach> <c:if test="${totalBlock > nowBlock+1 }">
									<a
										href="BoardController.do?command=${board_type }&i=${i }&paging=true&nowBlock=${nowBlock + 1}&nowPage=${(nowBlock+1)*pagePerBlock }">
										▶▶다음 </a>
								</c:if></td>
						</tr>
					</table>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>