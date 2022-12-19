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
    <link rel="stylesheet" href="resource/css/index.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script src="resource/js/index.js"></script>
    <title>오점뭐?</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    <!-- header -->

    <nav class="nav">
        <div class="container">
            <ul class="nav__menu">
                <li class="nav__item">
                    <a href="index.html" class="nav__link active">오점뭐</a>
                </li>
                <li class="nav__item">
                    <a href="calendar.html" class="nav__link">어점뭐</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- nav -->
    
    <main class="home">
        <div class="container">
            <section class="timer">
                <header class="section__headings">
                    <h2 class="section__heading--big timer__heding">점심시간까지 남은시간</h2>
                    <p class="timer__timer">
                        <span class="timer__hours">03</span>:
                        <span class="timer__minutes">20</span>:
                        <span class="timer__seconds">11</span>:
                        <span class="timer__millisecond">100</span>
                    </p>
                    <p class="timer__menu">SK구내</p>
                </header>
            </section>
            <!-- timer -->
    
            <section class="menu">
                <h2 class="section__heading">오늘의 메뉴</h2>
                <article class="section__content">
                    <table class="menu__list">
                        <thead class="menu__list-head">
                            <tr>
                                <th width="10%">No</th>
                                <th width="60%">제목</th>
                                <th width="20%">작성시간</th>
                                <th width="10%">조회수</th>
                            </tr>
                        </thead>
                        <tbody class="menu__list-body">
                            <tr>
                                <td>5</td>
                                <td><a href="board.html">SK구내</a></td>
                                <td>10:59:59</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td><a href="board.html">부대찌개</a></td>
                                <td>10:20:00</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><a href="board.html">찜닭</a></td>
                                <td>10:18:37</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><a href="board.html">순댓국</a></td>
                                <td>10:17:42</td>
                                <td>4</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td><a href="board.html">갈비탕</a></td>
                                <td>09:40:17</td>
                                <td>6</td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <div class="search">
                    <form action="index.html" method="get" class="search__form">
                        <input type="search">
                        <button type="submit" class="search__btn">
                            <img src="resource/icon/search.png" alt="search">
                        </button>
                    </form>
                </div>
                <div class="pagination">
                    <button class="pagination__prev">
                        <img src="resource/icon/arrow-left.png" alt="left">
                    </button>
                    <button class="pagination__btn active"></button>
                    <button class="pagination__btn"></button>
                    <button class="pagination__btn"></button>
                    <button class="pagination__btn"></button>
                    <button class="pagination__btn"></button>
                    <button class="pagination__next">
                        <img src="resource/icon/arrow-right.png" alt="next">
                    </button>
                </div>
                <div class="menu__links">
                    <button onClick="location.href='vote.html'" class="link-btn">투표하기</button>
                    <button onClick="location.href='boardForm.html'" class="link-btn">메뉴등록</button>
                </div>
            </section>
        </div>
    </main>
    <!-- menu -->

    <section class="vote-rs">
        <div class="container">
            <table class="vote-rs__content">
                <caption class="section__heading"> 투표 결과 </caption>
                <thead>
                    <tr>
                        <th width="30%"> 메뉴 </th>
                        <th width="70%"> 득표수 </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th> SK구내 </th>
                        <td>
                            <table width="50%" class="ratio">
                                <tr><td></td></tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th> 까치네 </th>
                        <td>
                            <table width="20%" class="ratio">
                                <tr><td></td></tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th> 부대찌개 </th>
                        <td>
                            <table width="10%" class="ratio">
                                <tr><td></td></tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th> 순댓국 </th>
                        <td>
                            <table width="0%" class="ratio">
                                <tr><td></td></tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th> 갈비탕 </th>
                        <td>
                            <table width="20%" class="ratio">
                                <tr><td></td></tr>
                            </table>
                        </td>
                    </tr> 
                </tbody>
            </table>
        </div>
    </section>
    <!-- vote-rs -->

	<%@ include file="common/footer.jsp" %>
    <!-- footer -->
</body>
</html>