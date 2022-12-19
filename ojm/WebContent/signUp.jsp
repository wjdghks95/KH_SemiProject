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
    <link rel="stylesheet" href="resource/css/signUp.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script src="resource/js/signUp.js"></script>
    <title>회원가입</title>
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
            <section class="signUp-modal">
                <article class="signUp-modal__container">
                    <form action="signUp" method="post" class="signUp-modal__form">
                        <div class="form__group">
                            <label for="user_id" class="form__label">아이디</label>
                            <input type="text" name="id" id="user_id" placeholder="아이디를 입력하세요">
                            <p class="form__msg" id="msg_id"></p>
                        </div>
                        <div class="form__group">
                            <label for="user_pwd" class="form__label">비밀번호</label>
                            <input type="password" name="password" id="user_pwd" placeholder="특수문자를 포함한 문자와 숫자 8~12자의 비밀번호를 입력하세요">
                            <p class="form__msg" id="msg_pwd"></p>
                        </div>
                        <div class="form__group">
                            <label for="user_pwdChk" class="form__label">비밀번호 확인</label>
                            <input type="password" id="user_pwdChk" placeholder="비밀번호를 한번 더 입력하세요">
                            <p class="form__msg" id="msg_pwdChk"></p>
                        </div>
                        <div class="form__group">
                            <label for="user_name" class="form__label">이름</label>
                            <input type="text" name="name" id="user_name" placeholder="이름을 입력하세요">
                            <p class="form__msg" id="msg_name"></p>
                        </div>
                        <div class="form__group">
                            <label for="user_birthdayY" class="form__label">생년월일</label>
                            <div class="signUp-modal__birthday-container">
                                <input type="number" id="user_birthdayY" placeholder="년(4자리)">
                                <select id="user_birthdayM">
                                    <option selected disabled style="display: none;">월</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                                <input type="number" id="user_birthdayD" min="1" max="31" placeholder="일">
                            </div>
                            <input type="hidden" name="birthday" id="user_birthday">
                            <p class="form__msg" id="msg_birthday"></p>
                        </div>
                        <div class="form__group">
                            <label for="user_gender" class="form__label">성별</label>
                            <select name="gender" id="user_gender">
                                <option selected disabled style="display: none;">성별</option>
                                <option value="1">남</option>
                                <option value="2">여</option>
                            </select>
                            <p class="form__msg" id="msg_gender"></p>
                        </div>
                        <div class="form__group">
                            <label for="user_email" class="form__label">이메일</label>
                            <div class="signUp-modal__email-container">
                                <input type="text" id="user_email" placeholder="이메일을 입력하세요">
                                <span class="signUp-modal__email-symbol">@</span>
                                <input type="text" id="user_email-addr">
                                <select id="user_email-addr-list">
                                    <option selected disabled style="display: none;">선택</option>
                                    <option value="">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="google.com">google.com</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
                            </div>
                            <input type="hidden" name="email">
                            <p class="form__msg" id="msg_email"></p>
                        </div>
                        <div class="form__group signUp-modal__emailChk-button">
                            <button type="button" class="default-btn" disabled>이메일 인증하기</button>
                        </div>
                        <div class="signUp-modal__emailChk">
                            <div class="form__group signUp-modal__emailChk-container">
                                <input type="text" id="user-emailChk" placeholder="인증코드 6자리 입력">
                                <span class="signUp-modal__emailChk-time">03:00</span>
                                <button type="button" class="chk-btn">확인</button>
                                <input type="hidden" id="isEmailChk" value="false">
                            </div>
                        </div>
                        <p class="form__msg" id="msg_emailChk"></p>
                        <div class="signUp-modal__submit">
                            <button type="button" class="default-btn">가입하기</button>
                        </div>
                    </form>
                </article>
            </section>
            <!-- signUp-modal -->
        </div>
    </main>
</body>
</html>