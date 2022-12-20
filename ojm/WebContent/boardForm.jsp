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
		if (bean.getBoard_chk() == '1') {
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
    <link rel="stylesheet" href="resource/css/boardForm.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35a126d9615f944036a7884668c732d3&libraries=services"></script>
    <script src="resource/js/boardForm.js" defer></script>
    <title>메뉴등록</title>
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
        <section class="menu-modal">
            <div class="container">
                <header class="section__headings">
                    <h2 class="section__heading--big">메뉴 등록</h2>
                    <p class="section__subheading">메뉴는 하루에 한 가지만 등록할 수 있습니다.</p>
                </header>
                <article class="section__content">
                    <form action="newBoard" method="post" class="menu-modal__form">
                        <table class="menu-modal__table">
                            <tbody>
                                <tr>
                                    <th width="30%">메뉴</th>
                                    <td width="70%"><input type="text" name="menu" placeholder="메뉴를 입력하세요"></td>
                                    <input type="hidden" id="menu_chk" value="false">
                                </tr>
                                <tr>
                                    <th>설득하기</th>
                                    <td><textarea name="content" id="" cols="70%" rows="10" placeholder="친구들을 설득하기 위한 내용을 작성하세요"></textarea></td>
                                </tr>
                                <tr>
                                    <th>맛집 위치</th>
                                    <td class="map_wrap">
                                        <div id="map"></div>
                                        <div class="hAddr">
                                            <span class="title">지도중심기준 행정동 주소정보</span>
                                            <span id="centerAddr"></span>
                                        </div>
                                    </td>
                                </tr>
                                <input type="hidden" name="address">
                            </tbody>
                        </table>
                        <div class="menu-modal__buttons">
                            <button type="button" class="submit-btn">등록</button>
                            <button type="button" class="cancel-btn" onclick="location.href='index.jsp'">메뉴</button>
                        </div>
                    </form>
                </article>
            </div>
        </section>
        <!-- menu-modal -->
    </main>

    <%@ include file="common/footer.jsp" %>
    <!-- footer -->
</body>
</html>