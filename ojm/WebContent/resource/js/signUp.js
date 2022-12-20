$(function() {
    $('#user_email-addr-list').on('change', function() {
        let val = $(this).children('option:selected').val();

        if(val !== "") {
            $('#user_email-addr').val(val);
            $('#user_email-addr').hide();
        } else {
            $('#user_email-addr').val("");
            $('#user_email-addr').show();
        } 
        addUpEmail();
    });
    
    $('#user_email, #user_email-addr').on('keyup', function() {
        addUpEmail();
    })

    $('#user_birthdayY, #user_birthdayD').on('blur', function() {
        addUpBirthday();
    })

    $('#user_birthdayM').on('change', function() {
        addUpBirthday();
    })

    $('.signUp-modal__emailChk-button').on('click', function() {
        $('#msg_emailChk').text('');
        $('#msg_emailChk').removeClass('error');
        $('#msg_email').text('');
        $('#user_email').attr('disabled', true);
        $('#user_email-addr').attr('disabled', true);
        $('#user_email-addr-list').attr('disabled', true);

        alert('인증번호가 발송되었습니다.');
        $('.signUp-modal__emailChk').show();
        stopTimer(timer);
        sendCertificationNum();
    })

    let pwdChk = false;
    $('#user_pwdChk, #user_pwd').on('keyup', function() {
        pwdChk = pwdValidate();
    })

    $('.signUp-modal__submit').on('click', function() {
        if(!pwdChk) {
            $('#msg_pwdChk').text('비밀번호가 일치하지 않습니다.');
            $('#msg_pwdChk').addClass('error');
        }

        if(validate() && pwdChk) {
			alert('회원가입에 성공하였습니다.');
            $('.signUp-modal__form').submit();
        }
    })
})

// 이메일 합치기
function addUpEmail() {
    let totalEmail;
    if($('#user_email').val() !== '' && $('#user_email-addr').val() !== '') {
        totalEmail = $('#user_email').val() + '@' + $('#user_email-addr').val();
        $("input[name='email']").val(totalEmail);
    } else {
        $("input[name='email']").val('');
    }
    emailValidate(totalEmail);
}

// 이메일 검증
function emailValidate(email) {
    let regExp = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

    if(regExp.test(email)) {
        // 이메일 중복 검사
        emailDuplicateChk(email);
    } else {
        $('.signUp-modal__emailChk-button').children().attr('disabled', true);
    }
}

// 이메일 중복 검사 ajax
function emailDuplicateChk(email) {
    $.ajax({
        url: "emailDuplicateChk.do",
        data: {"email" : email},
        method: "GET",
        success: function(result) {
            if($.parseJSON(result)) {
                $('#msg_email').text('이미 존재하는 이메일입니다.');
                $('#msg_email').addClass('error');
                $('.signUp-modal__emailChk-button').children().attr('disabled', true);
            } else {
                $('#msg_email').text('');
                $('#msg_email').removeClass('error');
                $('.signUp-modal__emailChk-button').children().attr('disabled', false);
            }
        },
        error: function() {
            console.log("ajax통신 실패");
        }
    })
}

// 이메일 인증번호 발송
function sendCertificationNum() {
    let code = "";
    let email = $('input[name="email"]').val();
    
    $.ajax({
        url: "mail.do",
        data: {"email" : email},
        method: "GET",
        success: function(result) {
            code = result;
            startTimer(code);
        },
        error: function() {
            console.log("ajax통신 실패");
        }
    })
}

// 이메일 인증 타이머
let timer;
function startTimer(code) {
    let time = 180;
    let min = "";
    let sec = ""

    timer = setInterval(function() {
        min = parseInt(time / 60);
        sec = time % 60;
    
        if(min < 10) {
            min = '0' + min;
        }
        if(sec < 10) {
            sec = '0' + sec;
        }
    
        $('.signUp-modal__emailChk-time').text(`${min}:${sec}`);
        time--;
    
        if(time < 0) {
            alert('인증에 실패하였습니다. 다시 시도해주세요.');
            clearInterval(timer);
            code = "";
        }

        $('.chk-btn').on('click', function() {
            if(emailAuthValidate(code)) {
                clearInterval(timer);
            }
        })
    }, 1000);
}

function stopTimer() {
    clearInterval(timer);
}

// 이메일 인증
function emailAuthValidate(code) {
    if($('#user-emailChk').val() === "") {
        $('#msg_emailChk').text('인증번호를 입력하세요.');
        $('#msg_emailChk').addClass('error');
        return;
    }

    if($('#user-emailChk').val() == code) {
        $('#msg_emailChk').text('인증성공!');
        $('#msg_emailChk').removeClass('error');
        $('#user-emailChk').attr('readonly', true);
        $('.signUp-modal__emailChk-button').children().attr('disabled', true);
        $('#isEmailChk').val('true');
        return true;
    } else {
        $('#msg_emailChk').text('인증에 실패하였습니다. 다시 확인해주세요.');
        $('#msg_emailChk').addClass('error');
        return false;
    }
}

// 비밀번호 확인
function pwdValidate() {
    if($('#user_pwd').val() !== "" && $('#user_pwdChk').val() !== "") {
        if($('#user_pwd').val() === $('#user_pwdChk').val()) {
            $('#msg_pwdChk').text('비밀번호가 일치합니다.')
            $('#msg_pwdChk').removeClass('error');
            return true;
        } else {
            $('#msg_pwdChk').text('비밀번호가 일치하지 않습니다.')
            $('#msg_pwdChk').addClass('error');
            return false;
        }
    } else {
        $('#msg_pwdChk').text('')
        $('#msg_pwdChk').removeClass('error');
        return false;
    }
    
}

// 생일 합치기
function addUpBirthday() {
    if($('#user_birthdayY').val() !== '' && $('#user_birthdayM').val() !== ''
        && $('#user_birthdayD').val() !== '') {
            let year = $('#user_birthdayY').val();
            let month = $('#user_birthdayM option:selected').val();
            let date = $('#user_birthdayD').val();

            if(month < 10) {
                month = '0' + month;
            }
            if (date < 10) {
                date = '0' + date;
            }
            let totalBirthday = `${year}-${month}-${date}`;
            $('#user_birthday').val(totalBirthday);
        } else {
            $('#user_birthday').val('');
        }
}

// 입력값 검증
function validate() {
    // id
    let id = $('#user_id').val();
    let idChk = false;
    let regExp =  /^[a-zA-Z0-9]{4,7}$/;
    if(!regExp.test(id)) {
        $('#msg_id').text('4~7자의 영문과 숫자 조합만 사용가능합니다.')
        $('#msg_id').addClass('error');
        $('#user_id').focus();
        idChk = false;
    } else {
        $.ajax({
            url: 'idDuplicateChk.do',
            method: 'GET',
            data: {'id': id},
            async: false,
            success: function(result) {
                if($.parseJSON(result)) {
                    $('#msg_id').text('이미 존재하는 아이디입니다.');
                    $('#msg_id').addClass('error');
                    idChk = false;
                } else {
                    $('#msg_id').text('멋진 아이디네요!');
                    $('#msg_id').removeClass('error');
                    idChk = true;
                }
            }, 
            error: function() {
                console.log('ajax 통신 실패');
            }
        })
    }

    // 비밀번호
    let pwdChk = false;
    regExp = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
    if(!regExp.test($('#user_pwd').val())) {
        $('#msg_pwd').text('8~16자의 영문 대 소문자, 숫자, 특수문자를 사용하세요.')
        $('#msg_pwd').addClass('error');
        $('#user_pwd').focus();
        pwdChk = false;
    } else {
        $('#msg_pwd').text('')
        $('#msg_pwd').removeClass('error');
        pwdChk = true;
    }

    //이름
    let nameChk = false;
    regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}$/;
    if(!regExp.test($('#user_name').val())) {
        $('#msg_name').text('한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)')
        $('#msg_name').addClass('error');
        $('#user_name').focus();
        nameChk = false;;
    } else {
        $('#msg_name').text('')
        $('#msg_name').removeClass('error');
        nameChk = true;
    }

    // 생년월일
    let birthChk = false;
    if($('#user_birthdayY').val().length != 4 ) {
        $('#msg_birthday').text('태어난 년도 4자리를 정확하게 입력하세요.')
        $('#msg_birthday').addClass('error');
        $('#user_birthdayY').focus();
        birthChk = false;
    } else if($('#user_birthdayM').val() === "" || $('#user_birthdayM').val() === null) {
        $('#msg_birthday').text('태어난 월을 선택하세요.')
        $('#msg_birthday').addClass('error');
        $('#user_birthdayY').focus();
        birthChk = false;
    } else if($('#user_birthdayD').val() < 1 || $('#user_birthdayD').val() > 31) {
        $('#msg_birthday').text('태어난 일(날짜) 정확하게 입력하세요.')
        $('#msg_birthday').addClass('error');
        $('#user_birthdayD').focus();
        birthChk = false;
    } else {
        $('#msg_birthday').text('')
        $('#msg_birthday').removeClass('error');
        birthChk = true;
    }

    if(birthChk && $('#user_birthdayY').val() < 1900 ||
    birthChk && $('#user_birthdayY').val() > new Date().getFullYear()) {
        $('#msg_birthday').text('정말입니까?');
        $('#msg_birthday').removeClass('error');
    }

    // 성별
    let genderChk = false;
    if($('#user_gender').val() === "" || $('#user_gender').val() === null) {
        $('#msg_gender').text('성별을 선택하세요.')
        $('#msg_gender').addClass('error');
        $('#user_gender').focus();
        genderChk = false;
    } else {
        $('#msg_gender').text('')
        $('#msg_gender').removeClass('error');
        genderChk = true;
    }

    // 이메일
    let emailChk = false;
    if($('#user_email').val() === "" ||  $('#user_email').val() === null) {
        $('#msg_email').text('이메일을 입력하세요.')
        $('#msg_email').addClass('error');
        $('#user_email').focus();
        emailChk = false;
    } else if($('#user_email-addr').val() === "" || $('#user_email-addr').val() === null) {
        $('#msg_email').text('이메일 주소를 입력하세요.')
        $('#msg_email').addClass('error');
        emailChk = false;
    } else {
        $('#msg_email').text('')
        $('#msg_email').removeClass('error');
        emailChk = true;
    }

    // 이메일 인증
    let emailAuthChk = $.parseJSON($('#isEmailChk').val());
    if(!emailAuthChk) {
        $('#msg_emailChk').text('이메일 인증을 완료해주세요.');
        $('#msg_emailChk').addClass('error');
    }
    
    if(idChk && pwdChk && nameChk && birthChk && genderChk && emailChk && emailAuthChk) {
        return true;
    } else {
        return false;
    }
}