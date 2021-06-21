<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="login.css" rel="stylesheet" type="text/css">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="login.js"></script>
<!DOCTYPE html>
        <meta charset="UTF-8" />
        <title>Login and Registration</title>
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
		<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<style>
			.check{
				color: red;
				font-size: 3px;
			}
			.check2{
				color: green;
				font-size: 3px;
			}
		</style>
    </head>
    <body>
        <div class="container">
        	<header></header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="../memberLoginAction.do" > 
                                <h1>로그인</h1> 
                                <p> 
                                    <label for="username" class="uname" > Your ID</label>
                                    <input id="id" name="id" required="required" type="text" placeholder="아이디는 8~20자 이내로 작성해 주세요"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd"> Your Password </label>
                                    <input id="pw" name="pw" required="required" type="password" placeholder="비밀번호를 입력해 주세요" /> 
                                </p>
                                <p class="login button"> 
                                   <input type="submit" value="로그인" >
								</p>
                                <p class="change_link">
									아이디가 없으신가요?
									<a href="#toregister" class="to_register">회원가입</a>
								</p>
								<input type="hidden" name="i" value="0"/>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="loginProc.jsp" id="regsiter" > 
                                <h1> 회원 가입 </h1>
                                <p> 
                                    <label for="name" class="name" >이름</label>
                                    <input id="name" name="name" required="required" type="text" placeholder="2~5자 이내로 작성해 주세요" maxlength="5"/>
                                    <span id="name_check" class="check"></span>
                                    <span id="name_check2" class="check2"></span>
                                </p> 
                                <p> 
                                    <label for="id" class="id" >아이디</label>
                                    <input id="r_id" name="id" required="required" type="text" placeholder="특수문자 제외 8~20자 이내로 작성해 주세요" maxlength="20"/>
                                    <span id="id_check" class="check"></span>
                                    <span id="id_check2" class="check2"></span>
                                </p>
                                <p> 
                                    <label for="emailsignup" class="blog_name"  > 블로그 이름</label>
                                    <input id="blog_name" name="blog_name" required="required" type="tel" placeholder="블로그 이름은 수정할 수 없습니다."/>
                                    <input name="main_img" id="main_img" type="hidden" value="main.jpg">
                                    <span id="blog_check" class="check"></span> 
                                    <span id="blog_check2" class="check2"></span>
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail"  > 이메일</label><br>
                                    <input id="email" name="email" required="required" type="email" style="width: 230px" placeholder="이메일을 입력해 주세요"/>
                                    <input type="button" id="email_cf_btn" value="인증 요청" style="width: 65px;text-align: left;"><br>
                                    <span id="email_check" class="check"></span>
                                    <span id="email_check2" class="check2"></span><br>
                                    <input type="text"name="cf_num" id="cf_num" style="width: 70px"/>
                                    <span id="cf_num_check" class="check2" hidden><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-check' viewBox='0 0 16 16'><path d='M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z'/></svg></span>
                                    <input type="button" id="cf_num_btn" value="확인" style="width: 50px;text-align: left;"><br>
                                     <span id="cf_num_check2" class="check" hidden>번호가 일치하지 않습니다.</span>
                                </p>
                                <p> 	
                                    <label for="passwordsignup" class="youpasswd" >비밀번호 </label>
                                    <input id="r_pw" name="pw" required="required" type="password" placeholder="비밀번호를 입력해 주세요" maxlength="20" />
                                    <span id="pw_check" class="check"></span>
                                    <span id="pw_check2" class="check2"></span>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" >비밀번호 확인 </label>
                                    <input id="pw_confirm" name="pw_confirm" required="required" type="password" placeholder="위의 비밀번호와 똑같이 써주세요"/>
                                    <span id="pw_confirm_check" class="check"></span>
                                    <span id="pw_confirm_check2" class="check2"></span>
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" >전화번호</label>
                                    <input id="phone" name="phone" required="required" type="tel" placeholder="-제외하고 입력해 주세요" maxlength="11"/>
                                    <span id="phone_check" class="check"></span>
                                    <span id="phone_check2" class="check2"></span>
                                </p>
                               
                                <p class="signin button"> 
									<input type="submit" id="join" value="가입하기"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>