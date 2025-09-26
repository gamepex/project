/* dropdown */
$(function(){
$('#main-menu > li ').mouseenter(function(){
    $(this).find('.sub-menu').stop().slideDown();
});
$('#main-menu >li ').mouseleave(function(){
    $(this).find('.sub-menu').stop().slideUp();
});
});

/* trigger */
$(function(){
$('#trigger').click(function(e){
    e.preventDefault();
    $(this).toggleClass('tabmenu');
    $('#main-menu').toggleClass('tabmenu');
});
});

/* scroll */
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