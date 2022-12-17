$(function() {
    setInterval(remainedTime, 1);
})


function remainedTime() {
    const now = new Date(); // 현재 날짜와 시간
    const start = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 06, 00, 00, 000); // 시작시간(오늘 날짜의 오전 06시00분)
    const end = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 12, 20, 00, 000); // 종료시간(오늘 날짜의 오후 12시20분)

    let nt = now.getTime(); // 현재 시간
    let st = start.getTime(); // 시작 시간
    let et = end.getTime(); // 종료 시간

    // 현재 시간이 투표 시간인 경우 타이머 동작
    if(nt > st && nt < et) {
        $(".timer__timer").show();
        $(".timer__menu").hide();
        $('.vote-rs').hide();
        $('.menu__links > .link-btn').attr('disabled', false);

        $(".timer__heding").text("점심시간까지 남은시간");
        time = parseInt(et - nt) / 1000;
        
        day  = parseInt(time/60/60/24);
        time = (time - (day * 60 * 60 * 24));
        hour = parseInt(time/60/60);
        time = (time - (hour*60*60));
        min = parseInt(time/60);
        time = (time - (min*60));
        sec = parseInt(time);
        ms = parseInt((time*1000) - (sec*1000));

        if(hour < 10)
            hour = "0" + hour;
        if(min < 10) 
            min = "0" + min;
        if(sec < 10)
            sec = "0" + sec;
        if(ms < 10) {
            ms = "00" + ms;
        } else if(ms >= 10 && ms < 100){
            ms = "0" + ms;
        }
        
        // 1분 남은 경우 빨간색으로 표시
        if(hour < 1 && min < 1) {
            $(".timer__seconds").css("color", "var(--color-red)");
            $(".timer__millisecond").css("color", "var(--color-red)");
        }
        
        $(".timer__hours").html(hour);
        $(".timer__minutes").text(min);
        $(".timer__seconds").text(sec);
        $(".timer__millisecond").text(ms);
    } else {
        $('.vote-rs').show();
        $('.menu__links > .link-btn').attr('disabled', true);
        
        $(".timer__seconds").css("color", "var(--color-black)");
        $(".timer__millisecond").css("color", "var(--color-black)");

        // 투표 시간이 아닌 경우 당첨 메뉴 표시
        $(".timer__heding").text('오늘의 메뉴');
        $(".timer__timer").hide();

        // ---------- TODO ajax 통신으로 당첨 메뉴 가지고오기 ------------
        $(".timer__menu").show();
    }
}