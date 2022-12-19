<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resource/icon/favicon.png">
    <link rel="stylesheet" href="resource/css/style.css">
    <link rel="stylesheet" href="resource/css/login.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script src="resource/js/login.js"></script>
<%
	String error = request.getParameter("error"); 
	if(Boolean.parseBoolean(error)) {
%>
	<script>
		$(function() {
			$('#msg_login').text('로그인에 실패하였습니다. 다시 시도하세요.');		
		})
	</script>
<%
	}
%>
    <title>로그인</title>
</head>
<body>
    <main>
        <div class="container">
            <header class="section__headings">
                <div class="header__logo">
                    <a href="index.jsp">
                        <img src="resource/image/logo.png" alt="로고">
                    </a>
                </div>
            </header>
            <section class="login-modal">
                <article class="login-modal__container">
                    <form action="login" method="post" class="login-modal__form">
                        <div class="form__group">
                            <div class="form__icon">
                                <img src="resource/icon/account.png" alt="계정">
                            </div>
                            <input type="text" name="email" placeholder="이메일을 입력해주세요">
                        </div>
                        <div class="form__group">
                            <div class="form__icon">
                                <img src="resource/icon/pass.png" alt="잠금" style="padding: 6px;">
                            </div>
                            <input type="password" name="password" placeholder="패스워드를 입력해주세요">
                        </div>
                        <div class="form__group">
                            <label class="form__label"><input type="checkbox"> 아이디 저장</label>
                        </div>
                        <p class="form__msg error" id="msg_login"></p>
                        <div class="login-modal__submit">
                            <button type="submit" class="default-btn">로그인</button>
                        </div>
                    </form>
                </article>
                <a href="signUp.jsp" class="login-modal__signUp-link">회원가입</a>
            </section>
            <!-- login-modal -->
        </div>
    </main>
</body>
</html>