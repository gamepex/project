$(function(){

   $('#main-menu >li ').mouseenter(function(){
      $(this).find('.sub-menu').stop().slideDown();
      $('header').addClass('active')
    });

       $('#main-menu >li ').mouseleave(function(){
       $(this).find('.sub-menu').stop().slideUp();
       $('header').removeClass('active')
     });
});