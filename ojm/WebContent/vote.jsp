<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="or.com.board.*, or.com.member.*, java.util.*" %>
<jsp:useBean id="bMgr" class="or.com.board.BoardMgr" />
<jsp:useBean id="mMgr" class="or.com.member.MemberMgr" />
<%
	Long id = session.getAttribute("key") != null ? (Long) session.getAttribute("key") : null;
	if(id == null) {
		response.sendRedirect("index.jsp");
	} else {
		MemberBean bean = mMgr.findById(id);
		if (bean.getVote_chk() == '1') {
			response.sendRedirect("index.jsp");			
		}
	}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resource/icon/favicon.png">
    <link rel="stylesheet" href="resource/css/style.css">
    <link rel="stylesheet" href="resource/css/vote.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script src="resource/js/vote.js"></script>
    <title>투표하기</title>
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

    <main>
        <section class="vote">
            <div class="container">
                <header class="section__headings">
                    <h2 class="section__heading--big">투표하기</h2>
                    <p class="section__subheading">오늘의 점심메뉴를 선택하세요<br>
                    <small>(2개까지 선택 가능)</small></p>
                </header>
                <article class="section__content">
                    <form action="vote" method="post" class="vote__form" id="voteFrm">
				<%
						ArrayList<BoardBean> bList = bMgr.getBoardList();
						int listSize = bList.size();
						for(int i=0; i<listSize; i++) {
							if(i == listSize)
								break;
							
							BoardBean bean = bList.get(i);
							Long board_id = bean.getBoard_id();
							String menu = bean.getMenu();
				%>
							<div class="form__group">
	                            <label class="form__label"><input type="checkbox" value="<%=menu %>">&emsp;<%=menu %></label>
	                        </div>
				<%
						}
				%>
                        <input type="hidden" name="menu">
                    </form>
                    <div class="vote__buttons">
                        <button type="button" form="voteFrm" class="submit-btn">투표완료</button>
                        <button type="button" class="cancel-btn" onClick="location.href='index.jsp'">메뉴</button>
                    </div>
                </article>
            </div>
        </section>
        <!-- vote -->
    </main>

    <%@ include file="common/footer.jsp" %>
    <!-- footer -->
</body>
</html>