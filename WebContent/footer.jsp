<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Untitled</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <style type="text/css">
    	.footer-basic {
  padding:40px 0;
  background-color:#ffffff;
  color:#4b4c4d;
}

.footer-basic ul {
  padding:0;
  list-style:none;
  text-align:center;
  font-size:18px;
  line-height:1.6;
  margin-bottom:0;
}

.footer-basic li {
  padding:0 10px;
}

.footer-basic ul a {
  color:inherit;
  text-decoration:none;
  opacity:0.8;
}

.footer-basic ul a:hover {
  opacity:1;
}

.footer-basic .social {
  text-align:center;
  padding-bottom:25px;
}

.footer-basic .social > a {
  font-size:24px;
  width:40px;
  height:40px;
  line-height:40px;
  display:inline-block;
  text-align:center;
  border-radius:50%;
  border:1px solid #ccc;
  margin:0 8px;
  color:inherit;
  opacity:0.75;
}

.footer-basic .social > a:hover {
  opacity:0.9;
}

.footer-basic .copyright {
  margin-top:15px;
  text-align:center;
  font-size:13px;
  color:#aaa;
  margin-bottom:0;
}
    </style>
</head>

<body>
    <div class="footer-basic">
        <hr style="background-color:black; height: 2px">
        <div class="row">
            <div class="social col-md-7 col-md-offset-3" style="margin-top: 60px;align-content:flex-end;">
	            <a href="https://www.instagram.com"><i class="icon ion-social-instagram"></i></a>
	            <a href="https://www.snapchat.com"><i class="icon ion-social-snapchat"></i></a>
	            <a href="https://twitter.com/?lang=ko"><i class="icon ion-social-twitter"></i></a>
	            <a href="https://ko-kr.facebook.com/"><i class="icon ion-social-facebook"></i></a>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
             <p class="copyright"><b>T-Blog© 2021</b></p>
            </div>
	        <div class="col-md-2">
                <form method="post" action="MailAction.do">
	            	<font size="1"style="font-weight: bold;"><span>Send to mail(T-Blog)</span></font><br>
	            	<p><input type="text" name="title" placeholder="제목" style="width:100"></p>
	            	<textarea name="text" rows="5" cols="20">phone:	            	    E-mail:	            	    문의 내용:</textarea>
	            	<button type="submit" style="background-color: white; border: none; font-size:4px">보내기</button>
	            </form>
	        </div>
       </div>
    </div>
</body>

</html>