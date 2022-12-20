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
    <link rel="stylesheet" href="resource/css/calendar.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script src="resource/js/calendar.js"></script>
    <title>캘린더</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    <!-- header -->
    
    <nav class="nav">
	    <div class="container">
	        <ul class="nav__menu">
	            <li class="nav__item">
	                <a href="index.jsp" class="nav__link">오점뭐</a>
	            </li>
	            <li class="nav__item">
	                <a href="calendar.jsp" class="nav__link active">어점뭐</a>
	            </li>
	        </ul>
	    </div>
	</nav>
	<!-- nav -->
    
    <section class="calendar">
        <div class="container">
            <header class="section__headings">
                <h2 class="section__heading--big">어제 점심은 뭐?</h2>
                <p class="section__subheading">투표 결과로 먹은 메뉴가 무엇인지 월별로 확인해보세요</p>
            </header>
            <article class="section__content">
                <header class="calendar__title">
                    <button class="calendar__button calendar__button--prev">
                        <img src="resource/icon/arrow-left.png" alt="prev">
                    </button>
                    <span class="calendar__current-year-month">May 2022</span>
                    <button class="calendar__button calendar__button--next">
                        <img src="resource/icon/arrow-right.png" alt="next">
                    </button>
                </header>
                <div class="calendar__content">
                    <div class="calendar__day-of-week">
                    <div class="calendar__dayHeader sun">Sun</div>
                    <div class="calendar__dayHeader">Mon</div>
                    <div class="calendar__dayHeader">Tue</div>
                    <div class="calendar__dayHeader">Wed</div>
                    <div class="calendar__dayHeader">Thu</div>
                    <div class="calendar__dayHeader">Fri</div>
                    <div class="calendar__dayHeader sat">Sat</div>
                    </div>
                    <div class="calendar__body">
                    </div>
                </div>
            </article>
        </div>
    </section>
    <!-- calendar -->

    <%@ include file="common/footer.jsp" %>
    <!-- footer -->
</body>
</html>