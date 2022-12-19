<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Long key = (Long) session.getAttribute("key");
%>
<header class="header">
    <div class="container">
        <div class="header__container">
            <div class="header__logo">
                <a href="index.jsp">
                    <img src="resource/image/logo.png" alt="로고">
                </a>
            </div>
            <div class="header__links">
<%
	if(key == null) {
%>
                <a href="login.jsp" class="header__link">로그인</a>
                <a href="signUp.jsp" class="header__link">회원가입</a>
<%
	} else {
%>
				<a href="logout.jsp" class="header__link">로그아웃</a>
<%
	}
%>
            </div>
        </div>
    </div>
</header>
<!-- header -->