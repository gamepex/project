$(function(){
    $(window).scroll(function(){
        var value=$(window).scrollTop();
        if(value >=300){
            $('header').addClass('dark')
        }else{
            $('header').removeClass('dark')
        }
    });
});