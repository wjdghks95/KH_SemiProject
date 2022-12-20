$(function() {
    $('.submit-btn').on('click', function() {        
        let menuList = [];

        if($("input[type='checkbox']:checked").length > 2) {
            alert('메뉴는 2개까지만 선택가능 합니다.');
            return;
        } else if($("input[type='checkbox']:checked").length === 0) {
            alert('메뉴를 선택하세요.');
            return;
        } else {
            $("input[type='checkbox']").each(function() {
                if($(this).is(":checked") === true) {
                    menuList.push($(this).val());
                }
            })
            $('input[name="menu"]').val(menuList);            
            alert('투표가 완료되었습니다.');
            $('#voteFrm').submit();
            window.open('pop-up.jsp', '투표현황', 'width=600, height=600');
        }
    })
})