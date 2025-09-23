// dropdown.js, trigger.js 같은 공통 부분은 여기다 통합하는 게 좋지 않을까요?

$(function(){
    $(window).scroll(function(){
        var value = $(window).scrollTop();
        if(value >= 150) {
            $('header').addClass('dark');
        } else {
            $('header').removeClass('dark');
        }
    });
});