// dropdown.js, trigger.js, scroll.js 같은 공통 부분은 여기다 통합하는 게 좋지 않을까요?

/* dropdown */
$(function(){

   $('#main-menu > li ').mouseenter(function(){
      $(this).find('.sub-menu').stop().slideDown();
      $('header').addClass('active');
    });

       $('#main-menu >li ').mouseleave(function(){
       $(this).find('.sub-menu').stop().slideUp();
       $('header').removeClass('active')
     });

     $('#tap1').click(()=>{
         
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