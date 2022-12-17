$(function() {
    $('.submit-btn').on('click', function() {        
        if($("input[name='menu']:checked").length > 2) {
            alert('메뉴는 2개까지만 선택가능 합니다.');
            return;
        } else {
            window.open('pop-up.html', '투표현황', 'width=600, height=600')
            $('#voteFrm').submit();
        }
    })
})