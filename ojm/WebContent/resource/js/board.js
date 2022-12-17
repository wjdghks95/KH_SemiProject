var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
let addr = $('.board__detail-addr').text();
geocoder.addressSearch(addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: `<div class="bAddr">${addr}</div>`
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});

// 마우스 드래그로 지도 이동 가능여부를 설정합니다
map.setDraggable(false);
map.setZoomable(false);  

$('.comment__form > button').on('click', function() {
    if($('.comment__form > input').val() === '' || $('.comment__form > input').val() === null) {
        $('#msg_comment').text('의견을 작성하세요.');
        return;
    } else {
        // ---------- TODO AJAX 통신 댓글 등록 -------------
        $('.comment__form').submit();
    }
})

$(document).on('click', '.comment__comment button', function() {
    // ---------- TODO 댓글 ID와 일치하는 대댓글 입력폼만 보여주기 --------
    $('.reply').show();
})

$(document).on('click', '.comment__reply-buttons > button:first-child', function() {
    // ------------ TODO 댓글 ID와 일치하는 곳에 대댓글 입력 ------------
    if($('.reply input[name="content"]').val() === '' || $('.reply input[name="content"]').val() === null) {
        alert('댓글을 입력하세요.');
    } else {
        $('.reply__form').submit();
    }
})

$(document).on('click', '.comment__reply-buttons > button:last-child', function() {
    // ------------ TODO 댓글 ID와 일치하는 대댓글 입력폼 숨김 ------------
    $('.reply').hide();
})