<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>현재 유저정보 출력화면</title>

<style type="text/css">
.tbl_model {
	position: relative;
	width: 80%;
	table-layout: fixed;
	border-spacing: 0;
	border-collapse: collapse;
	word-wrap: break-word;
	word-break: keep-all;
	border: 0;
	border-bottom: 1px solid #e5e5e5;
}

tbody {tbody { display:table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

}
.tbl_model td, .tbl_model th {
	line-height: 14px;
	text-align: left;
	vertical-align: top;
	letter-spacing: -1px;
	border: 0;
	border-top: 1px solid #e5e5e5;
}

.tbl_model th {
	color: #333;
	border-right: 1px solid #e5e5e5;
	background: #f9f9f9;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.contxt_tit {
	font-size: 20px;
}

.contxt_desc {
	font-size: 12px;
	opacity: 0.5;
}
.check{
	color: red;
	font-size: 3px;
}
.check2{
	color: green;
	font-size: 3px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		var contextPath = "${pageContext.request.contextPath}";
		var member_num = ${mdto.member_num};
		var nameReg = /^[가-힣]{2,5}$/;
		var idReg = /^[A-Za-z0-9]{8,20}$/;
		var blogReg = /^[A-Za-z0-9가-힣]{4,20}$/;
		var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,20}$/;
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var phoneReg = /^[0-9]{10,11}$/; 
		var check = 0;
		//id
		$("#id_btn").on("click",function() {
			var id = $("#id").val();
			$(this).attr("hidden",true);
			$("#id").removeAttr("disabled");
			$("#id").focus();
			$(".id").removeAttr("hidden");
			$(".id_cancle").on("click", function() {
				$(".id").attr("hidden", true);
				$("#id_btn").removeAttr("hidden");
				$("#id").val(id);
				$("#id").attr("disabled", true);
				$("#id_check2").text("");
				$("#id_check").text("");
			});
			$("#id").blur(function() {
				var id2 = $(this).val();
				if(id == id2){
					$("#id_check").text("이전의 아이디와 동일 합니다.");
					check = 0;
				}else{
					if (idReg.test(id2)) {
						$.ajax({
							type: "post",
							async: true,
							url: contextPath + "/UpdateCheck",
							data: {
								param: id2,
								command: "id",
							},
							dataType: "text",
							success: function(data) {
								if(data == "사용가능한 아이디입니다."){
									$("#id_check2").text(data);
									$("#id_check").text("");
									check = 1;
								}else{
									$("#id_check").text(data);
									$("#id_check2").text("");
									check = 0;
								}
							}
						});
					} else {
						$("#id_check").text("특수문자 한글 제외  8~20자 이내로 작성해 주세요");
						$("#id_check2").text("");
						check = 0;
					}
				}
			});
			$(".id_update").on("click",function() {
				if(check == 1){
					if(window.confirm("변경하시겠습니까?")){
						$("#form").attr("action","memberUpdateAction.do?command=id").submit();
					}
				}else{
					$("#id").focus();
				}
			});
		});
		//pwd	
		$(".pw_btn").on("click", function() {
			$(this).attr("hidden", true);
			$(".pass_div").removeAttr("hidden");
	
			$(".pw_cancle").on("click", function() {
				$("#pw").val("");
				$(".pass_div").attr("hidden", true);
				$(".pw_btn").removeAttr("hidden");
				$("#pw_check2").text("");
				$("#pw_check").text("");
				$("#new_pw").attr("disabled",true);
				$("#new_pw_confirm").attr("disabled",true);
				$("#pw").removeAttr("disabled");
				
			});
			
			$("#pw").blur(function(){
				var pw = $(this).val();
				$.ajax({
					type: "post",
					async: true,
					url: contextPath + "/UpdateCheck",
					data: {
						param: pw,
						command: "pw",
						member_num: member_num
					},
					dataType: "text",
					success: function(data) {
						if(data == "비밀번호 동일"){
							$("#pw_check").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check' viewBox='0 0 16 16'><path d='M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z'/></svg>");
							$("#pw_check2").text("");
							$("#new_pw").removeAttr("disabled");
							$("#new_pw_confirm").removeAttr("disabled");
							$("#pw").attr("disabled",true);
						}else{
							$("#pw_check2").text(data);
							$("#pw_check").text("");
						}
					}
				});
			});
			$("#new_pw").blur(function(){
				var pw = $("#pw").val();
				var new_pw = $("#new_pw").val();
				if(pw == new_pw){
					$("#new_pw_check").text("이전 비밀번호와 값이 같습니다.");
					$("#new_pw_check2").text("");
					check = 0;
				}else{
					if(pwReg.test(new_pw)){
						$("#new_pw_check2").text("사용가능한 비밀번호 입니다.");
						$("#new_pw_check").text("");
					}else{
						$("#new_pw_check").text("대소문자,숫자 및 특수 문자를 조합해 8~20자 이내로 작성해 주세요 ");
						$("#new_pw_check2").text("");
					}
				}
			});
			$("#new_pw_confirm").blur(function(){
				var new_pw = $("#new_pw").val();
				var new_pw_confirm = $("#new_pw_confirm").val();
				if(pwReg.test(new_pw)){
					if(new_pw == new_pw_confirm){
						$("#new_pw_confirm_check2").text("비밀번호 값이 일치 합니다.");
						$("#new_pw_confirm_check").text("");
						check = 1;
					}else{
						$("#new_pw_confirm_check").text("비밀번호 값이 서로 다릅니다.");
						$("#new_pw_confirm_check2").text("");
						check = 0;
					}
				}
			});
			
			$(".pw_update").click(function(){
				if(check == 1){
					if(window.confirm("변경하시겠습니까?")){
						$("#form").attr("action","memberUpdateAction.do?command=pw").submit();
					}
				}
			});
			
		});
		//name
		$("#name_btn").on("click",function() {
			var name = $("#name").val();
			$(this).attr("hidden", true);
			$("#name").removeAttr("disabled");
			$("#name").focus();
			$(".name").removeAttr("hidden");
			$(".name_cancle").on("click", function() {
				$(".name").attr("hidden", true);
				$("#name_btn").removeAttr("hidden");
				$("#name").attr("disabled", true);
				$("#name").val(name);
				$("#name_check2").text("");
				$("#name_check").text("");
			});
			$("#name").blur(function(){
				var name2 = $(this).val();
				if(name == name2){
					$("#name_check").text("이전의 이름과 동일 합니다.");
					check = 0;
				}else{
					if(nameReg.test(name2)){
						$("#name_check2").text("사용가능합니다.");
						$("#name_check").text("");
						check = 1;
					}else{
						$("#name_check").text("이름은 2~5자이내로 한글만 가능합니다");
						$("#name_check2").text("");
						check = 0;
					}
				}
			});
			$(".name_update").on("click",function() {
				if(check == 1){
					if(window.confirm("변경하시겠습니까?")){
						$("#form").attr("action","memberUpdateAction.do?command=name").submit();
					}
				}else{
					$("#name").focus();
				}
			});
		});
		//phone
		$("#phone_btn").on("click",function() {
			var phone = $("#phone").val();
			$(this).attr("hidden", true);
			$("#phone").removeAttr("disabled");
			$("#phone").focus();
			$(".phone").removeAttr("hidden");
			$(".phone_cancle").on("click", function() {
				$(".phone").attr("hidden", true);
				$("#phone_btn").removeAttr("hidden");
				$("#phone").attr("disabled", true);
				$("#phone").val(phone);
				$("#phone_check").text("");
				$("#phone_check2").text("");
			});
			
			$("#phone").blur(function() {
				var phone2 = $(this).val();
				if(phone == phone2){
					$("#phone_check").text("이전의 번호와 동일 합니다.");
					check = 0;
				}else{
					if (phoneReg.test(phone2)) {
						$.ajax({
							type: "post",
							async: true,
							url: contextPath + "/UpdateCheck",
							data: {
								param: phone2,
								command: "phone",
							},
							dataType: "text",
							success: function(data) {
								if(data == "다른 계정에서 사용하고 있는 번호입니다."){
									$("#phone_check").text(data);
									$("#phone_check2").text("");
									check = 0;
								}else{
									$("#phone_check2").text(data);
									$("#phone_check").text("");
									check = 1;
								}
							},
						});
					}else{
						$("#phone_check").text("번호가 올바르지 않습니다.")
						$("#phone_check2").text("");
						check = 0;
					}
				}
			});
			$(".phone_update").on("click",function() {
				if(check == 1){
					if(confirm("변경하시겠습니까?")){
						$("#form").attr("action","memberUpdateAction.do?command=phone").submit();
					}
				}else{
					$("#phone").focus();
				}
			});
		});
		//email
		$("#email_btn").on("click",function() {
			var email = $("#email").val();
			$(this).attr("hidden", true);
			$("#email").removeAttr("disabled");
			$("#email").focus();
			$(".email").removeAttr("hidden");
			$(".email_cancle").on("click", function() {
				$(".email").attr("hidden", true);
				$("#email_btn").removeAttr("hidden");
				$("#email").attr("disabled", true);
				$("#email").val(email);
				$("#email_check").text("");
				$("#email_check2").text("");
			});
		
		
			$("#email").blur(function() {
				var email2 = $(this).val();
				if(email == email2){
					$("#email_check").text("이전의 메일과 동일 합니다.");
					check = 0;
				}else{
					if (emailReg.test(email2)) {
						$.ajax({
							type: "post",
							async: true,
							url: contextPath + "/UpdateCheck",
							data: {
								param: email2,
								command: "email",
							},
							dataType: "text",
							success: function(data) {
								if(data == "다른 계정에서 사용하고 있는 메일입니다."){
									$("#email_check").text(data);
									$("#email_check2").text("");
									check = 0;
								}else{
									$("#email_check2").text(data);
									$("#email_check").text("");
									check = 1;
								}
							},
						});
					}else{
						$("#email_check").text("이메일이 올바르지 않습니다.")
						$("#email_check2").text("");
						check = 0;
					}
				}
			});
			$(".email_update").on("click",function() {
				if(check == 1){
					if(confirm("변경하시겠습니까?")){
						$("#form").attr("action","memberUpdateAction.do?command=email").submit();
					}
				}else{
					$("#email").focus();
				}
			});
		});
		
		$("#pw2").blur(function(){
			var pw2 = $(this).val();
			$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/UpdateCheck",
				data: {
					param: pw2,
					command: "pw",
					member_num: member_num
				},
				dataType: "text",
				success: function(data) {
					if(data == "비밀번호 동일"){
						$("#pw2_check").html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check' viewBox='0 0 16 16'><path d='M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z'/></svg>");
						$("#pw2_check2").text("");
						$("#pw2_btn").removeAttr("disabled");
						$("#pw2").attr("disabled",true);
					}else{
						$("#pw2_check2").text(data);
						$("#pw2_check").text("");
					}
				}
			});
		});
		$("#pw2_btn").click(function(){
			if(confirm("탈퇴하시겠습니까?")){
				$("#form").attr("action","MemberDeleteAction").submit();
			}else{
				$("#pw2_btn").attr("disabled",true);
				$("#pw2").removeAttr("disabled");
				$("#pw2").val("");
				$("#pw2_check2").text("");
				$("#pw2_check").text("");
			}
		});
	});
</script>

</head>
<body>
	<b><font size="6" color="gray">내 정보</font></b>
	<br>
	<br>
	<br>
	<form method="post" id="form">
		<table border="0" class="tbl_model">
			<tbody>
				<tr>
					<th width="30%">
						<div>블로그 이름</div>
					</th>
					<td width="70%">
						<div>
							<p class="contxt_tit">${mdto.blog_name }</p>
							<p class="contxt_desc">블로그 이름은 변경하실 수 없습니다.</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>사용자 아이디</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="id" name="id" value="${id }"
									disabled="disabled" style="border: 0;"><br>
								<span id="id_check" class="check"></span>
                                <span id="id_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">아이디는 한달에 한 번 변경하실 수 있습니다.</p>
							<p>
								<input type="button" id="id_btn" value="수정" />
							</p>
							<p class="id" hidden>
								<input class="id_cancle" type="button" value="수정 취소" /> <input
									class="id_update" type="button" value="수정 완료" />
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>사용자 이름</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="name" name="name" value="${mdto.name }" disabled="disabled" style="border: 0;" maxlength="5"><br>
								<span id="name_check" class="check"></span>
                                <span id="name_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">이름이나 생년월일, 성별 등의 정보가 변경되었다면 본인확인을 통해
								정보를 수정할 수 있습니다</p>
							<p>
								<input type="button" id="name_btn" value="수정" />
							</p>
							<p class="name" hidden>
								<input class="name_cancle" type="button" value="수정 취소" /> <input
									class="name_update" type="button" value="수정 완료" />
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>비밀번호</div>
					</th>
					<td>
						<div>
							<p>
								<input class="pw_btn" type="button" value="수정" />
							</p>
						</div>
						<div class="pass_div" hidden>
							<p>
								현재 비밀번호<br> <input type="password" id="pw" name="pw" />
							    <span id="pw_check" class="check2"></span>
								<br>
								<span id="pw_check2" class="check"></span>
                       
							</p>
							<p class="contxt_desc">현재 비밀번호를 입력해야 비밀번호를 변경하실 수 있습니다.</p>
							<p>
								변경할 비밀번호<br> <input type="password" id="new_pw" name="new_pw" disabled="disabled"/><br>
								<span id="new_pw_check" class="check"></span>
                                <span id="new_pw_check2" class="check2"></span>
							</p>
							<p>
								변경할 비밀번호 확인<br> <input type="password" id="new_pw_confirm" name="new_pw_confirm" disabled="disabled" /><br>
								<span id="new_pw_confirm_check" class="check"></span>
                                <span id="new_pw_confirm_check2" class="check2"></span>
							</p>
							<p>
								<input class="pw_cancle" type="button" value="수정 취소" /> <input
									class="pw_update" type="button" value="수정 완료" />
							</p>

						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>휴대전화</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="phone" name="phone" value="${mdto.phone }" disabled="disabled"
									style="border: 0" maxlength="11"><br>
								<span id="phone_check" class="check"></span>
                                <span id="phone_check2" class="check2"></span>
							</p>
							<p class="contxt_desc">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 사용할 전화
								입니다.</p>
							<p>
								<input type="button" id="phone_btn" value="수정" />
							</p>
							<p class="phone" hidden>
								<input class="phone_cancle" type="button" value="수정 취소" /> <input
									class="phone_update" type="button" value="수정 완료" />
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div>이메일</div>
					</th>
					<td>
						<div>
							<p class="contxt_tit">
								<input type="text" id="email" name="email" value="${mdto.email }" disabled="disabled"
									style="border: 0"><br>
								<span id="email_check" class="check"></span>
                                <span id="email_check2" class="check2"></span>	
							</p>
							<p class="contxt_desc">블로그의 안내에 대해 전달 받을 이메일
								주소 입니다.</p>
							<p>
								<input type="button" id="email_btn" value="수정" />
							</p>
							<p class="email" hidden>
								<input class="email_cancle" type="button" value="수정 취소" /> <input
									class="email_update" type="button" value="수정 완료" />
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th>회원 탈퇴</th>
					<td>
						<div>
							<p>
								<input type="password" id="pw2" name="pw2" />
							    <span id="pw2_check" class="check2"></span>
								<br>
								<span id="pw2_check2" class="check"></span>
							</p>
							<p class="contxt_desc">비밀번호를 입력해야 회원탈퇴가 가능합니다.</p>
							<input type="button" id="pw2_btn" value="회원탈퇴" disabled="disabled">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="member_num" value="${mdto.member_num}">
	</form>
</body>
</html>