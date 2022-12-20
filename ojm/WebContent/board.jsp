<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="or.com.board.*, java.util.*" %>
<jsp:useBean id="bMgr" class="or.com.board.BoardMgr" />
<%
	Long id = Long.parseLong(request.getParameter("id"));
	bMgr.updateViews(id);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resource/icon/favicon.png">
    <link rel="stylesheet" href="resource/css/style.css">
    <link rel="stylesheet" href="resource/css/board.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35a126d9615f944036a7884668c732d3&libraries=services"></script>
    <script src="resource/js/board.js" defer></script>
    <title>오늘의 메뉴 - 상세</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    <!-- header -->
    
    <nav class="nav">
	    <div class="container">
	        <ul class="nav__menu">
	            <li class="nav__item">
	                <a href="index.jsp" class="nav__link active">오점뭐</a>
	            </li>
	            <li class="nav__item">
	                <a href="calendar.jsp" class="nav__link">어점뭐</a>
	            </li>
	        </ul>
	    </div>
	</nav>
	<!-- nav -->

    <section class="board">
        <div class="container">
        	<%
        		BoardBean bean = bMgr.getBoard(id);
        		String menu = bean.getMenu();
        		String content = bean.getContent();
        		String address = bean.getAddress();
        	%>
            <header class="section__headings">
                <h2 class="section__heading--big"><%=menu %></h2>
            </header>
            <article class="section__content">
                <p class="board__content"><%=content %></p>
                <div class="board__addr" id="map"></div>
                <p class="board__detail-addr"><%=address %></p>
                <div class="board__button">
                    <a href="index.jsp" class="board__link">메뉴</a>
                </div>
            </article>
        </div>
    </section>
    <!-- board -->

    <section class="comment">
        <div class="container">
            <header class="section__headings">
                <h2 class="section__heading">의견 작성</h2>
                <p>서비스가 준비되지 않았습니다</p>
            </header>
            <!-- <article class="section__content">
                <ul class="comment__comments">
                    <li class="comment__comment">
                        <p class="comment__author">정환나</p>
                        <p class="comment__content">SK 구내 오바잖아</p>
                        <p class="comment__metadata">11:48<button class="overlay-btn">답글쓰기</button></p>
                    </li>
                    <div class="reply">
                        <p class="reply__author">강지만</p>
                        <form action="board.html" method="post" class="reply__form">
                            <input name="content" placeholder="댓글을 남겨보세요" autocomplete="off">
                            <div class="comment__reply-buttons">
                                <button type="submit" class="overlay-btn">등록</button>
                                <button type="button" class="overlay-btn">취소</button>
                            </div>
                        </form>
                    </div>
                <p class="form__msg error" id="msg_comment"></p>
            </article> -->
        </div>
    </section>
    <!-- comment -->

    <%@ include file="common/footer.jsp" %>
    <!-- footer -->
</body>
</html>