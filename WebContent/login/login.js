var nameReg = /^[가-힣]{2,5}$/;
var idReg = /^[A-Za-z0-9]{8,20}$/;
var blogReg = /^[A-Za-z0-9가-힣]{4,20}$/;
var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,20}$/;
var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneReg = /^01(?:0|1)([0-9]){7,8}$/;
var id_check = 0;
var name_check = 0;
var pw_check = 0;
var pw_confirm_check = 0;
var blog_check = 0;
var phone_check = 0;
var email_check = 0;
var email_check2 = 0;
var cf_num = 0;
var cf_num2 = 0

$(function() {
	$("#name").blur(function(){
		var name = $(this).val();
		if(!nameReg.test(name)){
			$("#name_check").text("한글로만 2~5자 이내로 작성해 주세요");
			$("#name_check2").text("");
			name_check = 0;
		}else{
			$("#name_check2").text("사용가능합니다.");
			$("#name_check").text("");
			name_check = 1;
		}
	});
	
	$("#r_pw").blur(function(){
		var pw = $(this).val();
		if(!pwReg.test(pw)){
			$("#pw_check").text("대소문자,숫자 및 특수 문자를 조합해 8~20자 이내로 작성해 주세요 ");
			$("#pw_check2").text("");
			pw_check = 0;
		}else{
			$("#pw_check2").text("사용가능한 비밀번호 입니다.");
			$("#pw_check").text("");
			pw_check = 1;
		}
	});
	$("#pw_confirm").blur(function(){
		var pw = $("#r_pw").val();
		var pw_confirm = $(this).val();
		if(pwReg.test(pw)){
			if(pw == pw_confirm){
				$("#pw_confirm_check2").text("비밀번호 값이 일치 합니다.");	
				$("#pw_confirm_check").text("");
				pw_confirm_check = 1;
			}else{
				$("#pw_confirm_check").text("비밀번호값이 서로 다릅니다.");
				$("#pw_confirm_check2").text("");
				pw_confirm_check = 0;
			}
		}
	});
	$("#r_id").blur(function() {
		var id = $(this).val();
		if (idReg.test(id)) {
			$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/RegisterCheck",
				data: {
					param: id,
					command: "id"
				},
				dataType: "text",
				success: function(data) {
					if(data == "중복된 아이디입니다."){
						$("#id_check").text(data);
						$("#id_check2").text("");
						id_check = 0;
					}else{
						$("#id_check2").text(data);
						$("#id_check").text("");
						id_check = 1;
					}
				},
			});
		} else {
			$("#id_check").text("특수문자 한글 제외  8~20자 이내로 작성해 주세요");
			$("#id_check2").text("");
			id_check = 0;
		}
	});
	$("#blog_name").blur(function() {
		var blog_name = $(this).val();
		if (blogReg.test(blog_name)) {
			$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/RegisterCheck",
				data: {
					param: blog_name,
					command: "blog_name"
				},
				dataType: "text",
				success: function(data) {
					if(data == "이미 존재하는 블로그 이름입니다."){
						$("#blog_check").text(data);
						$("#blog_check2").text("");
						blog_check = 0;
					}else{
						$("#blog_check2").text(data);
						$("#blog_check").text("");
						blog_check = 1;
					}
				},
			});
		}else {
			$("#blog_check").text("특수문자 제외 4~20자 이내로 작성해 주세요")
			$("#blog_check2").text("");
			blog_check = 0;
		}
	});
	
	$("#email").blur(function() {
		var email = $(this).val();
		if (emailReg.test(email)) {
			$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/RegisterCheck",
				data: {
					param: email,
					command: "email"
				},
				dataType: "text",
				success: function(data) {
					if(data == "다른 계정에서 사용하고 있는 메일입니다."){
						$("#email_check").text(data);
						$("#email_check2").text("");
						email_check = 0;
					}else{
						$("#email_check2").text(data);
						$("#email_check").text("");
						email_check = 1;
					}
				},
			});
		}else {
			$("#email_check").text("이메일을 제대로 작성해주세요.")
			$("#email_check2").text("");
			email_check = 0;
		}
	});
	
	$("#email_cf_btn").click(function(){
		if(email_check == 1){
			var email = $("#email").val();
			if(confirm("인증번호를 보내시겠습니까?")){
		  		$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/MailAuthentication",
				data: {
					address: email,
				},
				dataType: "text",
				success: function(data) {
					cf_num = data;
				}
			});
			}
		}
	});
	
	$("#cf_num_btn").click(function(){
		cf_num2 = $("#cf_num").val();
		if(cf_num == cf_num2 && cf_num !=""){
			$(this).attr("disabled",true);
			$("#cf_num").attr("disabled",true);
			$("#cf_num_check").removeAttr("hidden");
			$("#cf_num_check2").text("");
			email_check2 = 1;
		}else{
			$("#cf_num_check2").removeAttr("hidden")
		}
	});
	$("#phone").blur(function() {
		var phone = $(this).val();
		if (phoneReg.test(phone)) {
			$.ajax({
				type: "post",
				async: true,
				url: contextPath + "/RegisterCheck",
				data: {
					param: phone,
					command: "phone"
				},
				dataType: "text",
				success: function(data) {
					if(data == "다른 계정에서 사용하고 있는 번호입니다."){
						$("#phone_check").text(data);
						$("#phone_check2").text("");
						phone_check = 0;
					}else{
						$("#phone_check2").text(data);
						$("#phone_check").text("");
						phone_check = 1;
					}
				},
			});
		}else{
			$("#phone_check").text("번호가 올바르지 않습니다.")
			$("#phone_check2").text("");
			phone_check = 0;
		}
	});
	$("#join").click(function(){
		if(name_check ==0){
			$("#name").focus();
			return false;
		}else if(name_check ==0){
			$("#name").focus();
			return false;
		}else if(pw_check == 0){
			$("#r_pw").focus();
			return false;
		}else if(pw_confirm_check == 0){
			$("#pw_confirm").focus();
			return false;
		}else if(blog_check == 0){
			$("#blog_name").focus();
			return false;
		}else if(phone_check == 0){
			$("#phone").focus();
			return false;
		}else if(email_check == 0){
			$("#email").focus();
			return false;
		}else if(email_check2 == 0){
			$("#cf_num").focus();
			return false;
		}
	});
});