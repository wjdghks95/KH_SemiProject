$(function() {
    let now = new Date();
    buildCalendar(now);

    $('.calendar__button--prev').on('click', function() {
        now = new Date(now.getFullYear(), now.getMonth() - 1, now.getDate());
        removeCalendar();
        buildCalendar(now);

    })

    $('.calendar__button--next').on('click', function() {
        now = new Date(now.getFullYear(), now.getMonth() + 1, now.getDate());
        removeCalendar();
        buildCalendar(now);
    })
})

function buildCalendar(now) {
    let firstDate = new Date(now.getFullYear(), now.getMonth(), 1);
    const monthList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    const leapYear = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    const notLeapYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    
    // 윤년 체크
    if (firstDate.getFullYear() % 4 === 0 && firstDate.getFullYear() % 100 !== 0
        || firstDate.getFullYear() % 400 === 0) {
        pageYear = leapYear;
    } else {
        pageYear = notLeapYear;
    }

    // 월, 년도 출력
    $(".calendar__current-year-month").attr({
        'year' : firstDate.getFullYear(),
        'month': firstDate.getMonth()+1})
    .html(`${monthList[firstDate.getMonth()]}&nbsp;&nbsp;${now.getFullYear()}`);

    makeElement(firstDate); // 날짜 생성
    getToday(new Date()); // 오늘 날짜 표시

    // ----------- TODO ajax 통신을 통해 해당 일 메뉴 표시 ---------
}

function makeElement(firstDate) {
    let weekly = 100;
    let currentdate = 1;
    for (let i = 0; i < 6; i++) { //  한달에 최대 6주 이상인 경우는 없으므로 i가 6 보다 작을 때 까지 반복
    let weeklyEl = $("<div class='calendar__weekly'></div>");
        for (let j = 0; j < 7; j++) { // 일주일은 7일 이므로 i 가 7보다 작을 때까지 반복
            // 만약 해당 칸에 날짜가 없으면 div 엘리먼트만 생성
            if (i === 0 && j < firstDate.getDay() || currentdate > pageYear[firstDate.getMonth()]) {
                let dateEl = $("<div class='calendar__day'></div>");
                $(weeklyEl).append(dateEl);
            } else { 
                // 해당 칸에 날짜가 있으면 div 엘리먼트 생성 후 해당 날짜를 넣음
                let dateEl = $(`<div class='calendar__day'>
                                <p class="calendar__day-num">${currentdate}</p>
                                <p class="calendar__menu">SK구내</p>
                                </div>`);
                weeklyEl.append(dateEl);
                currentdate++;
            }
        }

    weekly++;
    $('.calendar__body').append(weeklyEl);
    }
}

function getToday(today) {
    const currYear = today.getFullYear();
    const currMonth = today.getMonth()+1;
    const currDate = today.getDate();

    if($(".calendar__current-year-month").attr('year') == currYear &&
    $(".calendar__current-year-month").attr('month') == currMonth) {
        $('.calendar__day-num').each(function() {
            if($(this).text() == currDate) {
                $(this).parent().addClass('active');
            }
        })
    }
}

function removeCalendar() {
    $('.calendar__day').each(function() {
        $(this).remove();
    })
}